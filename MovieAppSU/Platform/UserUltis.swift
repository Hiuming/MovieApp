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
        case firstTimeLaunch = "first_time_launch"
    }
    
    static var requestToken: String? {
        get { UserDefaults.standard.string(forKey: UserKey.requestToken.rawValue) }
        set { UserDefaults.standard.setValue(newValue, forKey: UserKey.requestToken.rawValue) }
    }
    
    static func deleteAllTokens() {
        UserDefaults.standard.removeObject(forKey: UserKey.requestToken.rawValue)
    }
    
    static var didFirstTimeLaunched: Bool {
        get { UserDefaults.standard.bool(forKey: UserKey.firstTimeLaunch.rawValue)}
        set { UserDefaults.standard.setValue(newValue, forKey: UserKey.firstTimeLaunch.rawValue) }
    }
    
}
