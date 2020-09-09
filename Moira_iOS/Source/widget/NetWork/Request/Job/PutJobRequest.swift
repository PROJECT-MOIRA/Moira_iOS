//
//  PutJobRequest.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation

class PutJobRequest: Codable {
    var field:String
    var description:String
    var people_num:Int
    var is_deadline:String
    var writer:String
    var contact:String
    var job_idx:Int
}
