//
//  DeleteStudyPostUseCase.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import Foundation
import RxSwift

class DeleteStudyPostUseCase: ParamUseCase {
    let studyRepository: StudyRepository
    
    init(studyRepository:StudyRepository){
        self.studyRepository = studyRepository
    }
    
    typealias Params = DeleteStudyRequest
    typealias T = Single<String>

    func buildUseCaseObservable(params:DeleteStudyRequest) -> Single<String> {
        return studyRepository.deleteJobPost(request: params)
    }
}
