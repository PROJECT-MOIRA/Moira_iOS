//
//  RegisterRequest.swift
//  Moira_iOS
//
//  Created by Dev.Young on 08/08/2020.
//

import Foundation

class RegisterRequest : Encodable{
    var id : String? = ""
    var pw : String? = ""
    var name : String? = ""
    var phone : String? = ""
    var email : String? = ""
    let accountType : String? = "1"
}
