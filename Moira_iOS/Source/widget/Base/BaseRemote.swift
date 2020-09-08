//
//  BaseRemote.swift
//  Moira_iOS
//
//  Created by Dev.Young on 29/07/2020.
//

import Foundation
import Moya
import RxSwift

class BaseRemote<T: TargetType>{
    let provider = MoyaProvider<T>(plugins: [NetworkLoggerPlugin()])
    let decoder = JSONDecoder()
}
