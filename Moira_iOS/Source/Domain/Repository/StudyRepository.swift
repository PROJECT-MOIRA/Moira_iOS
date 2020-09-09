//
//  StudyRepository.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import RxSwift

protocol StudyRepository {
    func getStudyPost() -> Single<Array<StudyPost>>
    
    func putJobPost(request: PutStudyRequest) -> Single<String>
    
    func postStudyPost(request: PostStudyRequest) -> Single<String>
    
    func deleteJobPost(request: DeleteStudyRequest) -> Single<String>
}
