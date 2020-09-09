//
//  PostRegisterUseCase.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import RxSwift

class PostRegisterUseCase: ParamUseCase {
    let authRepository: AuthRepository
    
    init(authRepository:AuthRepository){
        self.authRepository = authRepository
    }
    
    typealias Params = RegisterRequest
    typealias T = Single<String>

    func buildUseCaseObservable(params: RegisterRequest) -> Single<String> {
        return authRepository.postRegister(requestParam: params)
    }
}
