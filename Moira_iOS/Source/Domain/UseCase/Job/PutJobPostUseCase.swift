//
//  PutJobPostUseCase.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import Foundation
import RxSwift

class PutJobPostUseCase: ParamUseCase {
    let jobRepository: JobRepository
    
    init(jobRepository:JobRepository){
        self.jobRepository = jobRepository
    }
    
    typealias Params = PutJobRequest
    typealias T = Single<String>

    func buildUseCaseObservable(params: PutJobRequest) -> Single<String> {
        return jobRepository.putJobPost(request: params)
    }
}
