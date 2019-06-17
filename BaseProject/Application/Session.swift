//
//  Session.swift
//  Ebates
//
//  Created by Macbook on 10/9/18.
//  Copyright © 2018 personal. All rights reserved.
//

import Foundation
//import FacebookCore
//import FacebookLogin
//import GoogleSignIn
//import FBSDKCoreKit

class Session: NSObject {
   
    static let shared = Session()
    
    override init() {
        super.init()
        self.loadDefault()
    }
    
    // handle login token
    var token: String = "" {
        didSet {
            let userDef = UserDefaults.standard
            userDef.setValue(token, forKey: CONSTANT.keyToken)
        }
    }
    
    func loadDefault() {
        
        // listen invalid token
        NotificationCenter.default.addObserver(self, selector: #selector(Session.forceLogout), name: NOTIFICATION_NAME.invalidToken, object: nil)
    }
    
    @objc func forceLogout() {
        // go to login
        Session.shared.token = ""
    }
}
