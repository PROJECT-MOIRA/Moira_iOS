//
//  ReactorAssembly.swift
//  Moira_iOS
//
//  Created by Dev.Young on 31/07/2020.
//

import Foundation
import Swinject

class ReactorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeViewReactor.self) { r in
            return HomeViewReactor(getJobPostUseCase: r.resolve(GetJobPostUseCase.self)!,
                                   getStudyPostUseCase: r.resolve(GetStudyPostUseCase.self)!)
        }.inObjectScope(.container)
        
        container.register(GetJobViewReactor.self) { r in
            return GetJobViewReactor(getJobPostUseCase: r.resolve(GetJobPostUseCase.self)!)
        }.inObjectScope(.container)
        
        container.register(GetStudyMemberViewReactor.self) { r in
            return GetStudyMemberViewReactor(getStudyPostUseCase: r.resolve(GetStudyPostUseCase.self)!)
        }.inObjectScope(.container)
        
        container.register(WriteGetJobViewReactor.self) { r in
            return WriteGetJobViewReactor(postJobPostUseCase: r.resolve(PostJobPostUseCase.self)!)
        }.inObjectScope(.container)
        
        container.register(WriteGetStudyGroupViewReactor.self) { r in
            return WriteGetStudyGroupViewReactor(postStudyPostUseCase: r.resolve(PostStudyPostUseCase.self)!)
        }.inObjectScope(.container)
        
        container.register(JobViewerViewReactor.self) { r in
            return JobViewerViewReactor(getJobPostUseCase: r.resolve(GetJobPostUseCase.self)!)
        }.inObjectScope(.container)
        
        container.register(StudyGroupViewerViewReactor.self) { r in
            return StudyGroupViewerViewReactor(getStudyPostUseCase: r.resolve(GetStudyPostUseCase.self)!)
        }.inObjectScope(.container)
        
        container.register(LoginViewReactor.self) { r in
            return LoginViewReactor(postLoginUseCase: r.resolve(PostLoginUseCase.self)!)
        }.inObjectScope(.container)
    }
}
