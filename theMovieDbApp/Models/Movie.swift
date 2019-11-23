//
//  Movie.swift
//  theMovieDbApp
//
//  Created by leandro de araujo estrada on 23/11/19.
//  Copyright © 2019 Leandro Estrada. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie: Mappable{
    
    
    
   
    var popularity: Double = 0.0
    var vote_count: Int = 0
    var video: Bool = false
    var poster_path: String = ""
    var id: Int = 0
    var adult: Bool = false
    var backdrop_path: String = ""
    var original_language: String = ""
    var original_title: String = ""
    var genre_ids: [Int] = []
    var title: String = ""
    var vote_average: Double = 0.0
    var overview: String = ""
    var release_date: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        popularity <- map["popularity"]
        vote_count <- map["vote_count"]
        video <- map["video"]
        poster_path <- map["poster_path"]
        id <- map["id"]
        adult <- map["adult"]
        backdrop_path <- map["backdrop_path"]
        original_language <- map["original_language"]
        original_title <- map["original_title"]
        genre_ids <- map["genre_ids"]
        title <- map["title"]
        vote_average <- map["vote_average"]
        overview <- map["overview"]
        release_date <- map["release_date"]
    }
    
}

