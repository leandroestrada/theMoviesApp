//
//  UIImageViewExtension.swift
//  theMovieDbApp
//
//  Created by leandro de araujo estrada on 07/12/19.
//  Copyright © 2019 Leandro Estrada. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView{
    
    func loadImage(imageUrl: String){
        let baseUrlImage = "https://image.tmdb.org/t/p/original"
        let imageURL = URL(string: baseUrlImage + imageUrl)
        self.kf.setImage(with: imageURL)
    }
    
}


