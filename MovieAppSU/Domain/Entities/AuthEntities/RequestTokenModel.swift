//
//  RequestTokenModel.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 4/12/24.
//

import Foundation
import ObjectMapper

struct RequestTokenModel : Mappable {
    var success : Bool?
    var request_token : String?
    var expires_at : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        success <- map["success"]
        request_token <- map["request_token"]
        expires_at <- map["expires_at"]
    }

}
