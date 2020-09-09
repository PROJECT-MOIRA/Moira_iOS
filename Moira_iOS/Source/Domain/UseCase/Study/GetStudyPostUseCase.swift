//
//  GetStudyPostUseCase.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import Foundation
import RxSwift

class GetStudyPostUseCase: BaseUseCase {
    let studyRepository: StudyRepository
    
    init(studyRepository:StudyRepository){
        self.studyRepository = studyRepository
    }
    
    typealias T = Single<Array<StudyPost>>

    func buildUseCaseObservable() -> Single<Array<StudyPost>> {
        return studyRepository.getStudyPost()
    }
}
