//
//  PostStudyPostUseCase.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import Foundation
import RxSwift

class PostStudyPostUseCase: ParamUseCase {
    let studyRepository: StudyRepository
    
    init(studyRepository:StudyRepository){
        self.studyRepository = studyRepository
    }
    
    typealias Params = PostStudyRequest
    typealias T = Single<String>

    func buildUseCaseObservable(params:PostStudyRequest) -> Single<String> {
        return studyRepository.postStudyPost(request: params)
    }
}
