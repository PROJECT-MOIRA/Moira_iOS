//
//  KeychainService.swift
//  Moira_iOS
//
//  Created by Dev.Young on 28/07/2020.
//

import Foundation
import Security
import KeychainAccess

let usernameKey = "usernameKey"
let passwordKey = "passwordKey"

let keychain = Keychain(service: "com.dgsw.2020.hackathon.Moira-iOS")

/**
 민감한 정보를 저장하기 위해서 사용합니다
 */
public class KeychainService: NSObject {
    
    class var username: String? {
        get {
            return keychain[usernameKey]
        }
        set {
            keychain[usernameKey] = newValue
        }
    }
    
    class var password: String? {
        get {
            return keychain[passwordKey]
        }
        set {
            keychain[passwordKey] = newValue
        }
    }
}
