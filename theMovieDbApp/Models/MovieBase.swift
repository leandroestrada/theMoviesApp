//
//  MovieBase.swift
//  theMovieDbApp
//
//  Created by leandro de araujo estrada on 23/11/19.
//  Copyright © 2019 Leandro Estrada. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieBase: Mappable{
    var page: Int = 0
    var total_results: Int = 0
    var total_pages: Int = 0
    var results: [Movie] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        page <- map["page"]
        total_results <- map["total_results"]
        total_pages <- map["total_pages"]
        results <- map["results"]
    }
    
}
