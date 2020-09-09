//
//  PostJobRequest.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation

class PostJobRequest: Codable {
    var title:String
    var field:String
    var description:String
    var people_num:Int
    var is_deadline:Int
    var writer:String
    var contact:String
    
    init(title:String,field:String, description:String, people_num:Int, is_deadline:Int,writer:String, contact:String) {
        self.title = title
        self.field = field
        self.description = description
        self.is_deadline = is_deadline
        self.writer = writer
        self.contact = contact
        self.people_num = people_num
    }
}
