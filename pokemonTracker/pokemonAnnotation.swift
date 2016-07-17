//
//  pokemonAnnotation.swift
//  pokemonTracker
//
//  Created by Luke Murray on 7/16/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import Foundation
import MapKit


class pokemonAnnotation: mapAnnotation {
    
    var Votes : [Vote]
    var InitialTime : NSDate
    var Type : PokemonType
    
    init(type: PokemonType, coordinate: CLLocationCoordinate2D ) {
        
        Votes = [Vote]()
        InitialTime = NSDate()
        Type = type
        
        super.init(title: type.rawValue, coordinate: coordinate)
    }
    
    //uncomment this to display a subtitle on the annotation
//    var subtitle: String {
//        return locationName
//    }
}
