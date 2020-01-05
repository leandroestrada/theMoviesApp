//
//  MovieDetails.swift
//  theMovieDbApp
//
//  Created by leandro de araujo estrada on 04/01/20.
//  Copyright © 2020 Leandro Estrada. All rights reserved.
//

import Foundation
import ObjectMapper


class MovieDetails: Mappable {
    
    var runtime: Int = 0
    
    required convenience init(map: Map){
        self.init()
    }
    
    func mapping(map: Map) {
        runtime <- map["runtime"]
    }
    
}
