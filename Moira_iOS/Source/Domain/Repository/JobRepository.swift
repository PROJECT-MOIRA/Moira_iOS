//
//  JobRepository.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import RxSwift

protocol JobRepository {
    func getJobPost() -> Single<Array<JobPost>>
    
    func putJobPost(request: PutJobRequest) -> Single<String>
    
    func postJobPost(request: PostJobRequest) -> Single<String>
    
    func deleteJobPost(request: DeleteJobRequest) -> Single<String>
}
