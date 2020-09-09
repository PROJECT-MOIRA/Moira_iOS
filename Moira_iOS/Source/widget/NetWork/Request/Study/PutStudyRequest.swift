//
//  PutStudyRequest.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation

class PutStudyRequest: Codable {
    var subject:String
    var people_num:Int
    var schedule_description:String
    var is_deadline:String
    var writer:String
    var contact:String
}
