//
//  UserUltis.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 4/12/24.
//

import Foundation

class UserUltis {
    enum UserKey: String {
        case requestToken = "request_token"
    }
    
    static var requestToken: String? {
        get { UserDefaults.standard.string(forKey: UserKey.requestToken.rawValue) }
        set { UserDefaults.standard.setValue(newValue, forKey: UserKey.requestToken.rawValue) }
    }
    
    static func deleteAllTokens() {
        UserDefaults.standard.removeObject(forKey: UserKey.requestToken.rawValue)
    }
    
}
