//
//  DataSourceAssembly.swift
//  Moira_iOS
//
//  Created by Dev.Young on 02/08/2020.
//

import Foundation
import Swinject

class DataSourceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AuthDataSource.self) { _ in
            AuthDataSource(remote: AuthRemote(), cache: nil)
        }.inObjectScope(.container)
        
        container.register(JobDataSource.self) { _ in
            JobDataSource(remote: JobRemote(), cache: nil)
        }.inObjectScope(.container)
        
        container.register(StudyDataSource.self) { _ in
            StudyDataSource(remote: StudyRemote(), cache: nil)
        }.inObjectScope(.container)

    }
}
