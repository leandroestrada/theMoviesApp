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

        // Do any additional setup after loading the view.
    }
    
    
    func loadData(){
        NetworkManager.shared.fetchCast(id: theMovie!.id){ castBase in
            print(castBase)
            self.castTest.loadImage(imageUrl: castBase.cast[0].profilePath)
        }
        navigationController?.navigationBar.prefersLargeTitles = false
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(false, animated: false)
            if let topItem = navigationController?.navigationBar.topItem {
                   topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
            }
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
