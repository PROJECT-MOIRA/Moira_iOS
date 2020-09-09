//
//  AuthDataSource.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import Moya
import RxSwift

class AuthDataSource: BaseDataSource<AuthRemote, Any?> {
    func postLogin(requestParam:LoginRequest) -> Single<LoginResponse> {
        return remote.postLogin(requestParam: requestParam)
    }
    
    func postRegister(requestParam:RegisterRequest) -> Single<String> {
        return remote.postRegister(requestParam: requestParam)
    }
}
