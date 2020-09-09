//
//  MoiraGetMemberAPI.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Moya

enum MoiraGetMemberAPI {
    
    case getJobPost
    case postJobPost(request:PostJobRequest)
    case deleteJobPost(request:DeleteJobRequest)
    case putJobPost(request:PutJobRequest)
    
    case getStudyPost
    case postStudyPost(request:PostStudyRequest)
    case deleteStudyPost(request:DeleteStudyRequest)
    case putStudyPost(request:PutStudyRequest)
}

extension MoiraGetMemberAPI: TargetType {

    //EndPoint
    var baseURL: URL {
        return URL(string: Constants.DEFAULT_HOST+"")!
    }
    
    //서버의 도메인 뒤에 추가 될 Path (일반적으로 API)
    var path: String {
        switch self {
            case .getJobPost:
                return "/job"
            case .postJobPost:
                return "/job"
            case .deleteJobPost:
                return "/job"
            case .putJobPost:
                return "/job"
                
            case .getStudyPost:
                return "/study"
            case .postStudyPost:
                return "/study"
            case .deleteStudyPost:
                return "/study"
            case .putStudyPost:
                return "/study"
        }
    }
    
    //HTTP method (GET, POST, …)
    var method: Method {
        switch self {
            case .getJobPost:
                return .get
            case .postJobPost:
                return .post
            case .deleteJobPost:
                return .delete
            case .putJobPost:
                return .put
                
            case .getStudyPost:
                return .get
            case .postStudyPost:
                return .post
            case .deleteStudyPost:
                return .delete
            case .putStudyPost:
                return .put
        }
    }
    
    //테스트용 Mock Data
    var sampleData: Data {
        return Data()
    }
    
    //리퀘스트에 사용되는 파라미터 설정
    var task: Task {
        switch self {
            case .getJobPost:
                return .requestPlain
            case let .postJobPost(request):
                return .requestData(try! JSONEncoder().encode(request))
            case let .deleteJobPost(request):
                return .requestData(try! JSONEncoder().encode(request))
            case let .putJobPost(request):
                return .requestData(try! JSONEncoder().encode(request))
                
            case .getStudyPost:
                return .requestPlain
            case let .postStudyPost(request):
                return .requestData(try! JSONEncoder().encode(request))
            case let .deleteStudyPost(request):
                return .requestData(try! JSONEncoder().encode(request))
            case let .putStudyPost(request):
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
