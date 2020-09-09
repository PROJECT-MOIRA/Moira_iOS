//
//  GetJobPostUseCase.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import RxSwift

class GetJobPostUseCase: BaseUseCase {
    let jobRepository: JobRepository
    
    init(jobRepository:JobRepository){
        self.jobRepository = jobRepository
    }
    
    typealias T = Single<Array<JobPost>>

    func buildUseCaseObservable() -> Single<Array<JobPost>> {
        return jobRepository.getJobPost()
    }
}
