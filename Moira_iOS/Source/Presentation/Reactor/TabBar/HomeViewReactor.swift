//
//  HomeViewReactor.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import ReactorKit
import Foundation
import Moya
import RxCocoa

class HomeViewReactor: Reactor {
    var initialState: State
    var getJobPostUseCase:GetJobPostUseCase
    var getStudyPostUseCase:GetStudyPostUseCase
    
    var error: PublishRelay<Error>
    
    init(getJobPostUseCase:GetJobPostUseCase,getStudyPostUseCase:GetStudyPostUseCase){
        self.getJobPostUseCase = getJobPostUseCase
        self.getStudyPostUseCase = getStudyPostUseCase
        
        self.initialState = State(isLoading: false, jobPostArray: Array<JobPost>(), studyPostArray: Array<StudyPost>())
        self.error = PublishRelay<Error>()
    }
    
    //사용자의 Action
    enum Action {
        case getJobStudyPostRequest
    }
    
    //State를 바꾸는 가장 작은 단위
    enum Mutation {
        case setIsLoading(Bool)
        case setJobPostArray(Array<JobPost>)
        case setStudyPostArray(Array<StudyPost>)
    }
    
    //Data
    struct State {
        var isLoading: Bool
        var jobPostArray: Array<JobPost>
        var studyPostArray: Array<StudyPost>
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
            case .getJobStudyPostRequest:
                    return Observable.concat([.just(Mutation.setIsLoading(true)),
                                              getJobPostUseCase.buildUseCaseObservable()
                                                .asObservable()
                                                .do(onError: { [unowned self] error in
                                                    self.error.accept(error)
                                                })
                                                .map{ response in Mutation.setJobPostArray(response) },
                                              
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
            case let .setJobPostArray(data):
                state.jobPostArray = data
            case let .setStudyPostArray(data):
                state.studyPostArray = data
        }
        return state
    }
}

