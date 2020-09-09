//
//  PutStudyPostUseCase.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import Foundation
import RxSwift

class PutStudyPostUseCase: ParamUseCase {
    let studyRepository: StudyRepository
    
    init(studyRepository:StudyRepository){
        self.studyRepository = studyRepository
    }
    
    typealias Params = PutStudyRequest
    typealias T = Single<String>

    func buildUseCaseObservable(params:PutStudyRequest) -> Single<String> {
        return studyRepository.putJobPost(request: params)
    }
}
