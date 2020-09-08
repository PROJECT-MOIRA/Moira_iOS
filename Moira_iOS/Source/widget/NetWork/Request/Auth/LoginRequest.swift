//
//  LoginRequest.swift
//  Moira_iOS
//
//  Created by Dev.Young on 28/07/2020.
//

import Foundation

class LoginRequest : Encodable{
    var id : String = ""
    var pw : String = ""
    
    convenience init(id : String, pw : String) {
        self.init()
        self.id = id
        self.pw = pw
    }
}
