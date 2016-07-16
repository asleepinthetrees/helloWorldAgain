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
    
    init(pokemonName: String, coordinate: CLLocationCoordinate2D ) {
        super.init(title: pokemonName, coordinate: coordinate)
    }
    
    //uncomment this to display a subtitle on the annotation
//    var subtitle: String {
//        return locationName
//    }
}
