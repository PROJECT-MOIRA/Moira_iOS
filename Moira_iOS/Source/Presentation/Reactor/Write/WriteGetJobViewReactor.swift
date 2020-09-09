//
//  WriteGetJobViewReactor.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import ReactorKit
import Foundation
import Moya
import RxCocoa

class WriteGetJobViewReactor: Reactor {
    var initialState: State
    
    var error: PublishRelay<Error>
    
    let postJobPostUseCase: PostJobPostUseCase
    
    init(postJobPostUseCase:PostJobPostUseCase){
        self.postJobPostUseCase = postJobPostUseCase
        self.initialState = State(isNoProblem: false, isLoading: false)
        self.error = PublishRelay<Error>()
    }
    
    //사용자의 Action
    enum Action {
        case onClickApply(PostJobRequest)
    }
    
    //State를 바꾸는 가장 작은 단위
    enum Mutation {
        case setStatus(Bool)
        case setLoading(Bool)
    }
    
    //Data
    struct State {
        var isNoProblem: Bool
        var isLoading: Bool
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
            case let .onClickApply(request):
                return Observable.concat([.just(Mutation.setLoading(true)),
                                          .just(Mutation.setStatus(true)),
                                          postJobPostUseCase.buildUseCaseObservable(params: request)
                                            .asObservable()
                                            .do(onError: { [unowned self] error in
                                                self.error.accept(error)
                                            })
                                            .map{ _ in true }
                                            .catchErrorJustReturn(false)
                                            .map { Mutation.setStatus($0)},
                                          .just(Mutation.setLoading(false))])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
            case let .setStatus(isNoProblem):
                state.isNoProblem = isNoProblem
            case let .setLoading(isLoading):
                state.isLoading = isLoading
        }
        return state
    }
}

