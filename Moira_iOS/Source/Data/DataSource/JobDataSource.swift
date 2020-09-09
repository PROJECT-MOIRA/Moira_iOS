//
//  JobDataSource.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import Moya
import RxSwift

class JobDataSource: BaseDataSource<JobRemote, Any?> {
    func getJobPost() -> Single<Array<JobPost>>{
        return remote.getJobPost()
    }
    
    func putJobPost(request: PutJobRequest) -> Single<String>{
        return remote.putJobPost(request: request)
    }
    
    func postJobPost(request: PostJobRequest) -> Single<String>{
        return remote.postJobPost(request: request)
    }
    
    func deleteJobPost(request: DeleteJobRequest) -> Single<String>{
        return remote.deleteJobPost(request: request)
    }
}
