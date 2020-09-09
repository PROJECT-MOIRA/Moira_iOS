//
//  StudyDataSource.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import Moya
import RxSwift

class StudyDataSource: BaseDataSource<StudyRemote, Any?> {
    func getStudyPost() -> Single<Array<StudyPost>>{
        return remote.getStudyPost()
    }
    
    func putJobPost(request: PutStudyRequest) -> Single<String>{
        return remote.putStudyPost(request: request)
    }
    
    func postStudyPost(request: PostStudyRequest) -> Single<String>{
        return remote.postStudyPost(request: request)
    }
    
    func deleteJobPost(request: DeleteStudyRequest) -> Single<String>{
        return remote.deleteStudyPost(request: request)
    }
}
