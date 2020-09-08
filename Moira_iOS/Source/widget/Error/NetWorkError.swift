//
//  NetWorkError.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

enum NetWorkError: Error {
    case NetWorkError
    case Custom(status: Int = -1, errorBody: Dictionary<String, Any> = Dictionary())
}
