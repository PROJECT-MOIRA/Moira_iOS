//
//  LoginReactor.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/09.
//

import ReactorKit
import Foundation
import Moya
import RxCocoa

class LoginViewReactor:Reactor {
    var initialState: State
    let postLoginUseCase: PostLoginUseCase
    
    var error: PublishRelay<Error>
    
    init(postLoginUseCase:PostLoginUseCase){
        self.postLoginUseCase = postLoginUseCase
        
        self.initialState = State(isSuccessLogin: false, isLoading: false)
        self.error = PublishRelay<Error>()
    }
    
    //사용자의 Action
    enum Action {
        case login(loginRequest: LoginRequest)
    }
    
    //State를 바꾸는 가장 작은 단위
    enum Mutation {
        case setSuccessLogin(Bool)
        case setLoading(Bool)
    }
    
    //Data
    struct State {
        var isSuccessLogin: Bool
        var isLoading: Bool
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
            case let .login(loginRequest):
                
                if(loginRequest.id.isEmpty || loginRequest.pw.isEmpty){
                    let error = NetWorkError.Custom(errorBody: ["message":"양식이 비었습니다."])
                    self.error.accept(error)
                    return .error(error)
                }
                
                return Observable.concat([
                    Observable.just(Mutation.setLoading(true)),
                    postLoginUseCase.buildUseCaseObservable(params: loginRequest)
                        .asObservable()
                        .do(onError: { [unowned self] error in
                            self.error.accept(error)
                        })
                        .map { _ in true }
                        .catchErrorJustReturn(false)
                        .map { Mutation.setSuccessLogin($0) },
                    Observable.just(Mutation.setSuccessLogin(false)),
                    Observable.just(Mutation.setLoading(false))
                ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
            case let .setSuccessLogin(isSuccessLogin):
                state.isSuccessLogin = isSuccessLogin
                
            case let .setLoading(isLoading):
                state.isLoading = isLoading
        }
        return state
    }
}
