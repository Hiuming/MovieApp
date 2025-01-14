//
//  GenreMovieModel.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 18/12/24.
//

import ObjectMapper
import Foundation

struct GenreMovieModel : Mappable, Identifiable {
    var id: Int?
    var name: String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
       id <- map["id"]
       name <- map["name"]
    }

}


struct GenreWrapper: Mappable {
    var genre: [GenreMovieModel]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        genre <- map["genres"]
    }
}
