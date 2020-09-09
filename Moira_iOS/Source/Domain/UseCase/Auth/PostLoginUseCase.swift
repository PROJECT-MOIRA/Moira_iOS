//
//  PostLoginUseCase.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import RxSwift

class PostLoginUseCase: ParamUseCase {
    let authRepository: AuthRepository
    
    init(authRepository:AuthRepository){
        self.authRepository = authRepository
    }
    
    typealias Params = LoginRequest
    typealias T = Single<Void>

    func buildUseCaseObservable(params: LoginRequest) -> Single<Void> {
        return authRepository.postLogin(requestParam: params)
    }
}
