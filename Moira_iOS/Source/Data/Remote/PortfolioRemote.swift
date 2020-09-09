//
//  PortfolioRemote.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation
import RxSwift

class PortfolioRemote: BaseRemote<MoiraPortfolioAPI> {
    func getStudyPost() -> Single<Array<JobPost>>{
        return provider.rx.request(.getPortfolio).map(Response<Array<JobPost>>.self, using: decoder)
            .map { response -> Array<JobPost> in
                return response.data
            }
    }
//    
//    func postJobPost(request: PostPortfolioRequest) -> Single<String>{
//        return provider.rx.request(.postPortfolio(request: request)).map(Response<Notting>.self, using: decoder)
//            .map { response -> String in
//                return response.data
//            }
//    }
}
