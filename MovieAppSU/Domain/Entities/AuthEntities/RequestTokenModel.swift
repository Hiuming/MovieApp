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
    var guest_session_id : String?
    var expires_at : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        success <- map["success"]
        guest_session_id <- map["guest_session_id"]
        expires_at <- map["expires_at"]
    }

}
