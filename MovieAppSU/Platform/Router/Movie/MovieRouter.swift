//
//  MovieRouter.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 11/12/24.
//

import Alamofire

enum MovieRouter {
    case getPopularMovies(page: Int)
    case discoverMovies(page: Int)
}

extension MovieRouter: APIInputBase {
    var headers: HTTPHeaders {
        var header = HTTPHeaders()
        header.add(.authorization(bearerToken: "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTc5N2FmZTA0YmM0ODQxZGE0N2VhNzFhOTQwZTUxYiIsIm5iZiI6MTczMTY2MTUzNi44NDA5OTk4LCJzdWIiOiI2NzM3MGVlMGQ2M2ZlZDU4MjZjZjQ5Y2MiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.L9Kk-KnrTWrAlnGxKso35BPSm1CCIsHNmlWRmfLgo8k"))
        header.add(.accept("application/json"))
        return header
    }
    
    var url: URL {
        return URL(string:[Common.baseURL,service,path].joined(separator: "/"))!
    }
    
    var method: HTTPMethod {
        switch self {	
        case .getPopularMovies, .discoverMovies:
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
                "include_adult" : false,
                "language" : "en-US",
                "page":page,
                "sort_by": "popularity.desc"
            ]
        case .discoverMovies(let page):
            return [
                "include_adult" : "false",
                "language" : "en-US",
                "page":page,
                "include_video" : "false",
                "sort_by": "popularity.desc",
            ]
            
        }
    }
    
    var requireToken: Bool {
        return true
    }
    
    var service: String {
        switch self {
        case .getPopularMovies:
            return "movie"
        case .discoverMovies:
            return "discover"
        }
    }
    
    
    
    var path: String {
        switch self {
        case .getPopularMovies:
            return "popular"
        case .discoverMovies:
            return "movie"
        }
    }
}
