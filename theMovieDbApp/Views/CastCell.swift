//
//  CastCell.swift
//  theMovieDbApp
//
//  Created by leandro de araujo estrada on 31/12/19.
//  Copyright © 2019 Leandro Estrada. All rights reserved.
//

import UIKit

class CastCell: UICollectionViewCell {
    
    @IBOutlet weak var castImage: UIImageView!{
        didSet{
            castImage.layer.cornerRadius = 50
        }
    }
    @IBOutlet weak var actorNameLbl: UILabel!
    @IBOutlet weak var characterNameLbl: UILabel!
    
    
    
}
