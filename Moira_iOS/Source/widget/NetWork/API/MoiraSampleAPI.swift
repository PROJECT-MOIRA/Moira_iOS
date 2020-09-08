//
//  MoiraSampleAPI.swift
//  Moira_iOS
//
//  Created by Dev.Young on 18/08/2020.
//

import Moya

enum MoiraSampleAPI {
}

extension MoiraSampleAPI: TargetType {

    //EndPoint
    var baseURL: URL {
        return URL(string: Constants.DEFAULT_HOST+"sample")!
    }
    
    //서버의 도메인 뒤에 추가 될 Path (일반적으로 API)
    var path: String {
        switch self {
            
        }
    }
    
    //HTTP method (GET, POST, …)
    var method: Method {
        switch self {
        
        }
    }
    
    //테스트용 Mock Data
    var sampleData: Data {
        return Data()
    }
    
    //리퀘스트에 사용되는 파라미터 설정
    var task: Task {
        switch self {
        
        }
    }
    
    //허용할 response의 타입
    var validationType: Moya.ValidationType {
        return .successAndRedirectCodes
    }
    
    //HTTP header
    var headers: [String : String]? {
        var headers = ["Content-Type": "application/json"]
        headers["x-access-token"] = AuthController.token
        return headers
    }
    
}

