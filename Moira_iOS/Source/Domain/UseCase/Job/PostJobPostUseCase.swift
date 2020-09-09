//
//  PostJobPostUseCase.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import Foundation
import RxSwift

class PostJobPostUseCase: ParamUseCase {
    let jobRepository: JobRepository
    
    init(jobRepository:JobRepository){
        self.jobRepository = jobRepository
    }
    
    typealias Params = PostJobRequest
    typealias T = Single<String>

    func buildUseCaseObservable(params: PostJobRequest) -> Single<String> {
        return jobRepository.postJobPost(request: params)
    }
}
