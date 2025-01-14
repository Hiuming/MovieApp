//
//  AuthModel.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 4/12/24.
//

import Foundation
import ObjectMapper

struct AuthModel : Mappable {
    var success : Bool?
    var status_code : Int?
    var status_message : String?
    var expires_at : String?
    var request_token : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        success <- map["success"]
        status_code <- map["status_code"]
        status_message <- map["status_message"]
        expires_at <- map["expires_at"]
        request_token <- map["request_token"]
    }

}
