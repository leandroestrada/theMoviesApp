//
//  Images.swift
//  theMovieDbApp
//
//  Created by leandro de araujo estrada on 04/01/20.
//  Copyright © 2020 Leandro Estrada. All rights reserved.
//

import Foundation
import ObjectMapper

class Images: Mappable{
    
    var filePath: String = ""
    
    required convenience init(map: Map){
        self.init()
    }
    
    func mapping(map: Map) {
        filePath <- map["file_path"]
    }
    
}


class ImagesBase: Mappable {
    
    var backdrops: [Images] = []
        
    required convenience init(map: Map){
        self.init()
    }
    
    func mapping(map: Map) {
        backdrops <- map["backdrops"]
    }
    
}

