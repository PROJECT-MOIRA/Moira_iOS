//
//  AuthRepository.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import RxSwift

protocol AuthRepository {
    func postLogin(requestParam:LoginRequest) -> Single<Void>
    
    func postRegister(requestParam:RegisterRequest) -> Single<String>
}
