//
//  AuthRemote.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import RxSwift
import Moya

class AuthRemote: BaseRemote<MoiraAuthAPI> {
    
    func postLogin(requestParam: LoginRequest) -> Single<LoginResponse>{
        return provider.rx.request(.postLoginRequest(request: requestParam)).map(Response<LoginResponse>.self, using: decoder)
            .map { response -> LoginResponse in
                return response.data
            }
    }
    
    func postRegister(requestParam: RegisterRequest) -> Single<String>{
        return provider.rx.request(.postRegisterRequest(request: requestParam)).map(Response<Notting>.self, using: decoder)
            .map { response -> String in
                return response.message
            }
    }
}
