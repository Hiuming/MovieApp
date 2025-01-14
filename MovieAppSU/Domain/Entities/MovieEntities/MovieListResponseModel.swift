//
//  MovieListModel.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 11/12/24.
//

import Foundation
import ObjectMapper

struct MovieListResponseModel : Mappable {
    var page : Int?
    var results : [MovieModel]?
    var total_pages : Int?
    var total_results : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        page <- map["page"]
        results <- map["results"]
        total_pages <- map["total_pages"]
        total_results <- map["total_results"]
    }

}
