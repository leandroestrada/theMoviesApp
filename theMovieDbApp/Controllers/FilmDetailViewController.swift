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
    
    var theMovie: Movie?
        
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
   


    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
