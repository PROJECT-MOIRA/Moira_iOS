//
//  GetStudyMemberViewReactor.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import ReactorKit
import Foundation
import Moya
import RxCocoa

class GetStudyMemberViewReactor: Reactor {
    var initialState: State
    var getStudyPostUseCase:GetStudyPostUseCase
    
    var error: PublishRelay<Error>
    
    init(getStudyPostUseCase:GetStudyPostUseCase){
        self.getStudyPostUseCase = getStudyPostUseCase
        self.initialState = State(isLoading: false, studyPostArray: Array<StudyPost>())
        self.error = PublishRelay<Error>()
    }
    
    //사용자의 Action
    enum Action {
        case getStudyPostRequest
    }
    
    //State를 바꾸는 가장 작은 단위
    enum Mutation {
        case setIsLoading(Bool)
        case setStudyPostArray(Array<StudyPost>)
    }
    
    //Data
    struct State {
        var isLoading: Bool
        var studyPostArray: Array<StudyPost>
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
            case .getStudyPostRequest:
                    return Observable.concat([.just(Mutation.setIsLoading(true)),
                                              getStudyPostUseCase.buildUseCaseObservable()
                                                .asObservable()
                                                .do(onError: { [unowned self] error in
                                                    self.error.accept(error)
                                                })
                                                .map{ response in Mutation.setStudyPostArray(response) },
                                              .just(Mutation.setIsLoading(false))])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        
            case let .setIsLoading(isLoading):
                state.isLoading = isLoading
            case let .setStudyPostArray(data):
                state.studyPostArray = data
        }
        return state
    }
}

