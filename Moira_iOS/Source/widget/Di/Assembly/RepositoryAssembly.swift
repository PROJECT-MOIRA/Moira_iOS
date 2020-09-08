//
//  RepositoryAssembly.swift
//  Moira_iOS
//
//  Created by Dev.Young on 31/07/2020.
//

import Foundation
import Swinject

class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
//        container.register(AuthRepository.self) { r in
//            return AuthRepositoryImpl(authDataSource: r.resolve(AuthDataSource.self)!, memberDataSource: r.resolve(MemberDataSource.self)!)
//        }.inObjectScope(.container)
    }
}
