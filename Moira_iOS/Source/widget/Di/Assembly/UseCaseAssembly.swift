//
//  UseCaseAssembly.swift
//  Moira_iOS
//
//  Created by Dev.Young on 06/08/2020.
//

import Foundation
import Swinject

class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(PostLoginUseCase.self) { r in
            PostLoginUseCase(authRepository: r.resolve(AuthRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(PostRegisterUseCase.self) { r in
            PostRegisterUseCase(authRepository: r.resolve(AuthRepository.self)!)
        }.inObjectScope(.container)
        
        
        container.register(GetJobPostUseCase.self) { r in
            GetJobPostUseCase(jobRepository: r.resolve(JobRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(PostJobPostUseCase.self) { r in
            PostJobPostUseCase(jobRepository: r.resolve(JobRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(PutJobPostUseCase.self) { r in
            PutJobPostUseCase(jobRepository: r.resolve(JobRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(DeleteJobPostUseCase.self) { r in
            DeleteJobPostUseCase(jobRepository: r.resolve(JobRepository.self)!)
        }.inObjectScope(.container)
        
        
        container.register(GetStudyPostUseCase.self) { r in
            GetStudyPostUseCase(studyRepository: r.resolve(StudyRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(PostStudyPostUseCase.self) { r in
            PostStudyPostUseCase(studyRepository: r.resolve(StudyRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(PutStudyPostUseCase.self) { r in
            PutStudyPostUseCase(studyRepository: r.resolve(StudyRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(DeleteStudyPostUseCase.self) { r in
            DeleteStudyPostUseCase(studyRepository: r.resolve(StudyRepository.self)!)
        }.inObjectScope(.container)
    }
}
