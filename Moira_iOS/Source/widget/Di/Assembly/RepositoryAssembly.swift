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
        container.register(AuthRepository.self) { r in
            return AuthRepositoryImpl(authDataSource: r.resolve(AuthDataSource.self)!)
        }.inObjectScope(.container)
        
        container.register(StudyRepository.self) { r in
            return StudyRepositoryImpl(studyDataSource: r.resolve(StudyDataSource.self)!)
        }.inObjectScope(.container)
        
        container.register(JobRepository.self) { r in
            return JobRepositoryImpl(jobDataSource: r.resolve(JobDataSource.self)!)
        }.inObjectScope(.container)
    }
}
