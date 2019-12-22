//
//  FilmDetailViewController.swift
//  theMovieDbApp
//
//  Created by leandro de araujo estrada on 07/12/19.
//  Copyright © 2019 Leandro Estrada. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    

    @IBOutlet weak var castTest: UIImageView!
    @IBOutlet weak var movieRatingView:     UIView!{didSet{
        movieRatingView.layer.cornerRadius = 10
        }
    }

    var theMovie: Movie?
    var seldonItems: [String] = ["Apples", "Threes", "Oranges"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print(theMovie?.original_title)
        loadData()
       
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
    
    func loadData(){
        NetworkManager.shared.fetchCast(id: theMovie!.id){ castBase in
            print(castBase)
            self.castTest.loadImage(imageUrl: castBase.cast[0].profilePath)
        }
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seldonItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SecondScreenCollectionViewCell
        cell.dataLabel.text = seldonItems[indexPath.row]
        return cell
    }

}
