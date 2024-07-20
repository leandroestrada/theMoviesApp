//
//  MainViewController.swift
//  theMovieDbApp
//
//  Created by leandro de araujo estrada on 23/11/19.
//  Copyright © 2019 Leandro Estrada. All rights reserved.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var theSearchBar: UISearchBar!
    
    var movies: [Movie] = []
    var filteredMovies: [Movie] = []
    var searchActive: Bool = false
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        theSearchBar.delegate = self
    }
    
    func loadData(){
        NetworkManager.shared.fetchMoviesData(){  movieBase in
            self.movies = movieBase.results
            print(movieBase.results)
            self.moviesTableView.reloadData()
           
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "FilmDetailSegue"{
//            if let nextViewController = segue.destination as? FilmDetailViewController {
//                nextViewController.theMovie = sender as? Movie //Or pass any values
//            }
//        }
//    }
    
}

extension MainViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        self.performSegue(withIdentifier: "FilmDetailSegue", sender: movie)
    }
}

extension MainViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive{
            return filteredMovies.count
        }
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200 
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie: Movie
        if searchActive{
            movie = filteredMovies[indexPath.row]
        }else{
            movie = movies[indexPath.row]
        }
        //let movie = movies[indexPath.row]
        cell.movieTitle.text = movie.original_title
        cell.movieDescription.text = movie.overview
        cell.movieRating.text = "\(movie.vote_average)"
        cell.loadPoster(posterPath: movie.poster_path)
         //Para year, criar uma extensão de String para retonar apenas o ano
        
        return cell
    }
    
}

extension MainViewController: UISearchBarDelegate {
    
    func searchBar(_: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            self.filteredMovies = self.movies.filter { (movieList) -> Bool in
                (movieList.original_title.lowercased().contains(searchText.lowercased()))
            }
            self.searchActive = true
        } else {
            self.filteredMovies = self.movies
        }
        
        self.moviesTableView.reloadData()
    }
}


