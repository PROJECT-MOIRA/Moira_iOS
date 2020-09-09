//
//  DeleteJobPostUseCase.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import Foundation
import RxSwift

class DeleteJobPostUseCase: ParamUseCase {
    let jobRepository: JobRepository
    
    init(jobRepository:JobRepository){
        self.jobRepository = jobRepository
    }
    
    typealias Params = DeleteJobRequest
    typealias T = Single<String>

    func buildUseCaseObservable(params: DeleteJobRequest) -> Single<String> {
        return jobRepository.deleteJobPost(request: params)
    }
}
