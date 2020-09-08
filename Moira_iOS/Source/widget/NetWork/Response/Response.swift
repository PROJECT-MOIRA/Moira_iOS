//
//  Response.swift
//  Moira_iOS
//
//  Created by Dev.Young on 28/07/2020.
//

import Foundation

class Response<T: Codable>: Codable {
    var status : Int
    var message : String
    var data: T
}

class Notting: Codable {}
