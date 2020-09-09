//
//  Reactive.swift
//  Moira_iOS
//
//  Created by Dev.Young on 03/08/2020.
//

import Foundation
import RxSwift
import Moya
import Alamofire

extension Reactive where Base: MoyaProviderType {
    
    /// Designated request-making method.
    ///
    /// - Parameters:
    ///   - token: Entity, which provides specifications necessary for a `MoyaProvider`.
    ///   - callbackQueue: Callback queue. If nil - queue from provider initializer will be used.
    /// - Returns: Single response object.
    func request(_ token: Base.Target, callbackQueue: DispatchQueue? = nil) -> Single<Moya.Response> {
        return Single.create { [weak base] single in
            
            if(!NetworkReachabilityManager(host:Constants.DEFAULT_HOST)!.isReachable){
                let newError = NetWorkError.Custom(errorBody: ["message":"서버에 접속할 수 없습니다."])
                single(.error(newError))
            }
            
            let cancellableToken = base?.request(token, callbackQueue: callbackQueue, progress: nil) { result in
                switch result {
                    case let .success(response):
                        single(.success(response))
                        
                    case let .failure(error):
                        let errorBody = (try? error.response?.mapJSON() as? Dictionary<String, Any>) ?? Dictionary()
                        let status = error.response?.statusCode ?? 0
                        if(status != 200){
                            let newError = NetWorkError.Custom(status: status, errorBody: errorBody)
                            single(.error(newError))
                        }
                }
            }
            
            return Disposables.create {
                cancellableToken?.cancel()
            }
        }.timeout(10, scheduler: MainScheduler.asyncInstance)
    }
}
