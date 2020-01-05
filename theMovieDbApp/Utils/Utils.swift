//
//  Utils.swift
//  theMovieDbApp
//
//  Created by leandro de araujo estrada on 04/01/20.
//  Copyright © 2020 Leandro Estrada. All rights reserved.
//

import Foundation

class Utils{
    
    static let shared = Utils()
    
    func minutesToHoursMinutes (minutes : Int) -> (hours : Int , leftMinutes : Int) {
        return (minutes / 60, (minutes % 60))
    }
    
    //let tuple = minutesToHoursMinutes(minutes: 100)
    //
    //tuple.hours  /// 1
    //tuple.leftMinutes /// 40
}
