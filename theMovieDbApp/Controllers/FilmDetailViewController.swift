//
//  FilmDetailViewController.swift
//  theMovieDbApp
//
//  Created by leandro de araujo estrada on 07/12/19.
//  Copyright © 2019 Leandro Estrada. All rights reserved.
//

import UIKit


class FilmDetailViewController: UIViewController {
    
    var imgArr: [Images] = []
    
    @IBOutlet weak var movieTitleFilmDetailView: UILabel!
    
    @IBOutlet weak var movieRatingFilmDetailView: UILabel!
    @IBOutlet weak var movieBackgroundPicture: UIImageView!
    
    @IBOutlet weak var filmLengthLbl: UILabel!
    
    
    @IBOutlet weak var iCarouselFilmDetailView: iCarousel!
    
    
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
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.collectionViewCast.collectionViewLayout = layout
        
        iCarouselFilmDetailView.type = .linear
        iCarouselFilmDetailView.contentMode = .scaleAspectFit
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
        //        self.filmLengthLbl.text = ""
        loadBackdropImages()
    }
    
    
    func loadData(){
        NetworkManager.shared.fetchCast(id: theMovie!.id){ castBase in
            print(castBase)
            self.castArray = castBase.cast
            self.collectionViewCast.reloadData()
            NetworkManager.shared.fetchMovieDetails(movieId: self.theMovie!.id){runtime in
                print(runtime.runtime)
                let lenght = Utils.shared.minutesToHoursMinutes(minutes: runtime.runtime)
                self.filmLengthLbl.text = "Duração \(lenght.hours)h \(lenght.leftMinutes)min."
            }
            
        }
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func loadBackdropImages(){
        NetworkManager.shared.fetchImages(movieId: theMovie!.id){ imagesBase in
            if imagesBase.backdrops.count == 0 {
                let image = Images()
                image.filePath = self.theMovie!.backdrop_path
                self.imgArr.append(image)
            }else{
                self.imgArr = imagesBase.backdrops
            }
            self.iCarouselFilmDetailView.reloadData()
        }
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
            if cast.profilePath != "" {
                cell.castImage.loadImage(imageUrl: cast.profilePath)
            } else {
                cell.castImage.image = UIImage(named: "user ")
            }
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

extension FilmDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150.0, height: 150)
    }
}

extension FilmDetailViewController: iCarouselDelegate, iCarouselDataSource{
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return imgArr.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var imageView: UIImageView!
        if view == nil{
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            imageView.contentMode = .scaleAspectFit
        }else{
            imageView = view as? UIImageView
        }
        
        imageView.loadImage(imageUrl: imgArr[index].filePath)
        return imageView
    }
}
