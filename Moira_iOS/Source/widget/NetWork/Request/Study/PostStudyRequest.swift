//
//  PostStudyRequest.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation

class PostStudyRequest: Codable {
    var title:String
    var subject:String
    var people_num:Int
    var schedule_description:String
    var is_deadline:Int
    var writer:String
    var contact:String
    
    init(title:String,subject:String, people_num:Int, schedule_description:String, is_deadline:Int, writer:String, contact:String){
        self.title = title
        self.subject = subject
        self.people_num = people_num
        self.schedule_description = schedule_description
        self.is_deadline = is_deadline
        self.writer = writer
        self.contact = contact
    }
}
