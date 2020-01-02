//
//  FilmDetailViewController.swift
//  theMovieDbApp
//
//  Created by leandro de araujo estrada on 07/12/19.
//  Copyright © 2019 Leandro Estrada. All rights reserved.
//

import UIKit
import FSPagerView

class FilmDetailViewController: UIViewController {
    
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    
    @IBOutlet weak var movieTitleFilmDetailView: UILabel!
    
    @IBOutlet weak var movieRatingFilmDetailView: UILabel!
    @IBOutlet weak var movieBackgroundPicture: UIImageView!
    
    @IBOutlet weak var filmLengthLbl: UILabel!
    
    var minhasimagens: [String] = ["stones","stones","stones","stones"]
    
    var castArray: [Cast] = []
    
    
    @IBOutlet weak var movieDescriptionFilmDetailView: UILabel!
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
        loadPoster(posterPath: "")
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        
        
        collectionViewCast.reloadData()
        
        //        // Create a pager view
        //        let pagerView = FSPagerView(frame: frame1)
        //        pagerView.dataSource = self
        //        pagerView.delegate = self
        //        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        //        self.view.addSubview(pagerView)
        //        // Create a page control
        //        let pageControl = FSPageControl(frame: frame2)
        //        self.view.addSubview(pageControl)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.collectionViewCast.collectionViewLayout = layout
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
    func loadPoster(posterPath: String){
        
        self.moviePicture.loadImage(imageUrl: theMovie!.poster_path)
        self.movieBackgroundPicture.loadImage(imageUrl: theMovie!.backdrop_path)
        self.movieDescriptionFilmDetailView.text = theMovie?.overview
        self.movieTitleFilmDetailView.text = theMovie?.original_title
        self.movieRatingFilmDetailView.text = "\(theMovie!.vote_average)"
        
    }
    
    
    func loadData(){
        NetworkManager.shared.fetchCast(id: theMovie!.id){ castBase in
            print(castBase)
            self.castArray = castBase.cast
            self.collectionViewCast.reloadData()
            
            
        }
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
}

extension FilmDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate/*, UICollectionViewDelegateFlowLayout*/{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionViewCast{
        return castArray.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewCast {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "castCell", for: indexPath) as! CastCell
        let cast = castArray[indexPath.row]
        cell.characterNameLbl.text = cast.character
        cell.actorNameLbl.text = cast.name
        cell.castImage.loadImage(imageUrl: cast.profilePath)
        
        return cell
    }
        return UICollectionViewCell()
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

extension FilmDetailViewController: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return minhasimagens.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        
        
        
        cell.imageView?.image = UIImage(named: minhasimagens[index])
        cell.textLabel?.text = "\(minhasimagens[index])"
        return cell
    }
    
    
}

extension FilmDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150.0, height: 150)
    }
}

//extension FilmDetailViewController: UICollectionViewFlowLayout{
//
//    func
//
//}
