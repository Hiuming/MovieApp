//
//  MovieRouter.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 11/12/24.
//

import Alamofire

enum MovieRouter {
    case getPopularMovies(page: Int)
}

extension MovieRouter: APIInputBase {
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
        case .getPopularMovies:
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
        case .getPopularMovies(let page):
            return [
                "language" : "en-US",
                "page":page
            ]
       
        }
    }
    
    var requireToken: Bool {
        return true
    }
    
    var service: String {
        return "movie"
    }
    
    var subService: String {
       return ""
    }
    
    var path: String {
        switch self {
        case .getPopularMovies:
            return "popular"
        }
    }
}
