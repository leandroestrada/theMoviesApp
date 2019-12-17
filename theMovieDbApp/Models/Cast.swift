//
//  Cast.swift
//  theMovieDbApp
//
//  Created by leandro de araujo estrada on 07/12/19.
//  Copyright © 2019 Leandro Estrada. All rights reserved.
//

import Foundation
import ObjectMapper

class Cast: Mappable{
    
    var character: String = ""
    var name: String = ""
    var profilePath: String = ""
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        character <- map["character"]
        name <- map["name"]
        profilePath <- map["profile_path"]
    }
    
}


class CastBase: Mappable{
    
    var cast: [Cast] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        cast <- map["cast"]
    }
    
}


