//
//  LoginRouter.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 4/12/24.
//
import Alamofire

enum LoginRouter {
    case getRequestToken
    case login(userName: String, password: String)
}

extension LoginRouter: APIInputBase {
    var headers: HTTPHeaders {
        var header = HTTPHeaders()
        header.add(.authorization(bearerToken: "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTc5N2FmZTA0YmM0ODQxZGE0N2VhNzFhOTQwZTUxYiIsIm5iZiI6MTczMTY2MTUzNi44NDA5OTk4LCJzdWIiOiI2NzM3MGVlMGQ2M2ZlZDU4MjZjZjQ5Y2MiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.L9Kk-KnrTWrAlnGxKso35BPSm1CCIsHNmlWRmfLgo8k"))
        header.add(.accept("application/json"))
        return header
    }
    
    var url: URL {
        return URL(string:[Common.baseURL,service,subService,path].joined(separator: "/"))!
    }
    
    var method: HTTPMethod {
        switch self {
        case .getRequestToken:
            return .get
        default:
            return .post
        }
    }
    
    var encoding: ParameterEncoding {
        return method == .get ? URLEncoding.default : JSONEncoding.default
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getRequestToken:
            return [:]
        case .login(let userName, let password):
            return [
                "username" : userName,
                "password" : password,
                "request_token" : UserUltis.requestToken ?? ""
            ]
        }
    }
    
    var requireToken: Bool {
        return true
    }
    
    var service: String {
        return "authentication"
    }
    
    var subService: String {
        return "token"
    }
    
    var path: String {
        switch self {
        case .getRequestToken:
            return "new"
        case .login:
            return "validate_with_login"
        }
    }
    
    
    
}
