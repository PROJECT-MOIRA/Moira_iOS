//
//  AuthRepositoryImpl.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import RxSwift

class AuthRepositoryImpl:AuthRepository {
    
    private let authDataSource: AuthDataSource
    
    init(authDataSource: AuthDataSource){
        self.authDataSource = authDataSource
    }
    
    func postLogin(requestParam:LoginRequest) -> Single<Void> {
        return authDataSource.postLogin(requestParam: requestParam)
            .flatMap { response -> Single<Void> in
                AuthController.token = response.token
                return .just(Void())
            }
    }
    
    func postRegister(requestParam:RegisterRequest) -> Single<String> {
        return authDataSource.postRegister(requestParam: requestParam)
    }
}
