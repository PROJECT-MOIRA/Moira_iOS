//
//  JobRemote.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import RxSwift
import Moya

class JobRemote: BaseRemote<MoiraGetMemberAPI> {
    
    func getJobPost() -> Single<Array<JobPost>>{
        return provider.rx.request(.getJobPost).map(Response<Array<JobPost>>.self, using: decoder)
            .map { response -> Array<JobPost> in
                return response.data
            }
    }
    
    func putJobPost(request: PutJobRequest) -> Single<String>{
        return provider.rx.request(.putJobPost(request: request)).map(Response<Notting>.self, using: decoder)
            .map { response -> String in
                return response.message
            }
    }
    
    func postJobPost(request: PostJobRequest) -> Single<String>{
        return provider.rx.request(.postJobPost(request: request)).map(Response<Notting>.self, using: decoder)
            .map { response -> String in
                return response.message
            }
    }
    
    func deleteJobPost(request: DeleteJobRequest) -> Single<String>{
        return provider.rx.request(.deleteJobPost(request: request)).map(Response<Notting>.self, using: decoder)
            .map { response -> String in
                return response.message
            }
    }
    
}
