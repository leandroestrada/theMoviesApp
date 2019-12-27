//
//  FilmDetailViewController.swift
//  theMovieDbApp
//
//  Created by leandro de araujo estrada on 07/12/19.
//  Copyright © 2019 Leandro Estrada. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController {
    

    @IBOutlet weak var castTest: UIImageView!
    @IBOutlet weak var movieRatingView: UIView!{
        didSet{
        movieRatingView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var moviePicture: UIImageView!
    var theMovie: Movie?
    var seldonItems: [String] = ["Apples", "Threes", "Oranges","Abacaxi", "fhdsafja;dklfjakldfklassdkfas", "macds.af"]
    @IBOutlet weak var collectionViewCast: UICollectionView!{
        didSet{
            collectionViewCast.delegate = self
            collectionViewCast.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(theMovie?.original_title)
        loadData()
       
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        
        
        collectionViewCast.reloadData()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
    func loadPoster(posterPath: String){
        
    }
    
    
    func loadData(){
        NetworkManager.shared.fetchCast(id: theMovie!.id){ castBase in
            print(castBase)
            self.castTest.loadImage(imageUrl: castBase.cast[0].profilePath)
            self.moviePicture.loadImage(imageUrl: castBase.cast[1].profilePath)
            
        }
        navigationController?.navigationBar.prefersLargeTitles = false
    }

}

extension FilmDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate/*, UICollectionViewDelegateFlowLayout*/{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seldonItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SecondScreenCollectionViewCell
        cell.dataLabel.text = seldonItems[indexPath.row]
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {//size of your item for screen sizes
//           let wsize = UIScreen.main.bounds.size.width
//           switch(wsize){
//           case 414:
//               return CGSize(width: 110, height: 110)
//           case 375:
//               return CGSize(width: 100, height: 100)
//           case 320:
//               return CGSize(width: 90, height: 90)
//           default:
//               return CGSize(width: 100, height: 100)
//           }
//       }
    
    
}
