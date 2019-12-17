//
//  NetworkManager.swift
//  theMovieDbApp
//
//  Created by leandro de araujo estrada on 23/11/19.
//  Copyright © 2019 Leandro Estrada. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class NetworkManager{
    
    static let shared = NetworkManager()
    
    let baseUrl = "https://api.themoviedb.org/3/movie"
    let apiKey = "16fd5a2a34d2c3651edf338a920f6176"
    
    
    func fetchMoviesData(pages: Int = 1, completion: @escaping(MovieBase) -> Void){
        let url = baseUrl + "/top_rated?api_key=\(apiKey)&page=\(pages)"
        Alamofire.request(url, method: .get, parameters: nil, headers: nil).responseObject(completionHandler: {
            (response:DataResponse<MovieBase>) in
            completion(response.value!)
        })
    }
    
    func fetchCast(id: Int, completion: @escaping(CastBase) -> Void){
        let url = baseUrl + "/\(id)/credits?api_key=\(apiKey)"
        Alamofire.request(url, method: .get, parameters: nil, headers: nil).responseObject(completionHandler: {
                   (response:DataResponse<CastBase>) in
                   completion(response.value!)
               })
    }
}

