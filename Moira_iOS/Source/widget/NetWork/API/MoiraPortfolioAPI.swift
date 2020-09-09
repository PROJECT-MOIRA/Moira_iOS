//
//  MoiraPortfolioAPI.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Moya

enum MoiraPortfolioAPI {
    case getPortfolio
    case postPortfolio(request:PostPortfolioRequest)
}

extension MoiraPortfolioAPI: TargetType {

    //EndPoint
    var baseURL: URL {
        return URL(string: Constants.DEFAULT_HOST+"portfolio")!
    }
    
    //서버의 도메인 뒤에 추가 될 Path (일반적으로 API)
    var path: String {
        switch self {
            case .getPortfolio:
                return ""
            case .postPortfolio:
                return ""
        }
    }
    
    //HTTP method (GET, POST, …)
    var method: Method {
        switch self {
            case .getPortfolio:
                return .get
            case .postPortfolio:
                return .post
        }
    }
    
    //테스트용 Mock Data
    var sampleData: Data {
        return Data()
    }
    
    //리퀘스트에 사용되는 파라미터 설정
    var task: Task {
        switch self {
        case .getPortfolio:
            return .requestPlain
        case let .postPortfolio(request):
            return .requestData(try! JSONEncoder().encode(request))
        }
    }
    
    //허용할 response의 타입
    var validationType: Moya.ValidationType {
        return .successAndRedirectCodes
    }
    
    //HTTP header
    var headers: [String : String]? {
        var headers = ["Content-Type": "application/json"]
        headers["token"] = AuthController.token
        return headers
    }
    
}

