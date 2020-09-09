//
//  StudyRepositoryImpl.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import RxSwift

class StudyRepositoryImpl: StudyRepository {
    
    
    let studyDataSource:StudyDataSource

    
    init(studyDataSource:StudyDataSource) {
        self.studyDataSource = studyDataSource
    }
    
    
    func getStudyPost() -> Single<Array<StudyPost>> {
        return studyDataSource.getStudyPost()
    }
    
    func putJobPost(request: PutStudyRequest) -> Single<String> {
        return studyDataSource.putJobPost(request: request)
    }
    
    func postStudyPost(request: PostStudyRequest) -> Single<String> {
        return studyDataSource.postStudyPost(request: request)
    }
    
    func deleteJobPost(request: DeleteStudyRequest) -> Single<String> {
        return studyDataSource.deleteJobPost(request: request)
    }
    
    
}
