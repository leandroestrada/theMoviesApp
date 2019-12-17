//
//  MovieCell.swift
//  theMovieDbApp
//
//  Created by leandro de araujo estrada on 23/11/19.
//  Copyright © 2019 Leandro Estrada. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var theImageView: UIView!{
        didSet{
            theImageView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieImage: UIImageView!{
        didSet{
            movieImage.layer.cornerRadius = 12        }
    }
    @IBOutlet weak var theViewForCell: UIView!{
        didSet{
            theViewForCell.layer.cornerRadius = 10
        }
    }
        
    func loadPoster(posterPath: String){
        movieImage.loadImage(imageUrl: posterPath)
    }
}
