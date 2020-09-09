//
//  JobRepositoryImpl.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import RxSwift

class JobRepositoryImpl: JobRepository {
    let jobDataSource:JobDataSource
    
    init(jobDataSource:JobDataSource){
        self.jobDataSource = jobDataSource
    }
    
    func getJobPost() -> Single<Array<JobPost>> {
        return jobDataSource.getJobPost()
    }
    
    func putJobPost(request: PutJobRequest) -> Single<String> {
        return jobDataSource.putJobPost(request: request)
    }
    
    func postJobPost(request: PostJobRequest) -> Single<String> {
        return jobDataSource.postJobPost(request: request)
    }
    
    func deleteJobPost(request: DeleteJobRequest) -> Single<String> {
        return jobDataSource.deleteJobPost(request: request)
    }
    
}
