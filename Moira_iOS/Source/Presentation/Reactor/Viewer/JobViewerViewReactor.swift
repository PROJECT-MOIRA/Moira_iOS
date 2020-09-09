//
//  JobViewerViewReactor.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import ReactorKit
import Foundation
import Moya
import RxCocoa

class JobViewerViewReactor: Reactor {
    var initialState: State
    var getJobPostUseCase:GetJobPostUseCase
    
    var error: PublishRelay<Error>
    
    init(getJobPostUseCase:GetJobPostUseCase){
        self.getJobPostUseCase = getJobPostUseCase
        self.initialState = State(isLoading: false, jobPostArray: Array<JobPost>())
        self.error = PublishRelay<Error>()
    }
    
    //사용자의 Action
    enum Action {
        case getJobPostRequest
    }
    
    //State를 바꾸는 가장 작은 단위
    enum Mutation {
        case setIsLoading(Bool)
        case setJobPostArray(Array<JobPost>)
    }
    
    //Data
    struct State {
        var isLoading: Bool
        var jobPostArray: Array<JobPost>
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
            case .getJobPostRequest:
                    return Observable.concat([.just(Mutation.setIsLoading(true)),
                                              getJobPostUseCase.buildUseCaseObservable()
                                                .asObservable()
                                                .do(onError: { [unowned self] error in
                                                    self.error.accept(error)
                                                })
                                                .map{ response in Mutation.setJobPostArray(response) },
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
        }
        return state
    }
}

