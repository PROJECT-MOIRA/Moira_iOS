//
//  JobPost.swift
//  Moira_iOS
//
//  Created by Dev.Young on 2020/09/08.
//

import Foundation

class JobPost: Codable {
    let contact:String
    let description:String
    let field:String
    let is_deadline:Int
    let job_idx:Int
    let people_num:Int
    let title:String
    let writer:String
}
