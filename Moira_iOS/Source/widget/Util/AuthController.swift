//
//  AuthController.swift
//  Moira_iOS
//
//  Created by Dev.Young on 28/07/2020.
//

import Foundation

class AuthController {
    
    static var token = ""
    static var refreshToken = ""
    
    private static var _isSignIn = false
    class var isSignIn : Bool {
        get {
            return _isSignIn
        }
    }
    
    class func signIn(token: String, refreshToken: String) {
        _isSignIn = true
        
        self.token = token
        self.refreshToken = refreshToken
    }
    
    class func signOut() {
        _isSignIn = false
        
        KeychainService.username = nil
        KeychainService.password = nil
        
        self.token = ""
        self.refreshToken = ""
    }
}
