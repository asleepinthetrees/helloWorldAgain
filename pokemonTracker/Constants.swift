//
//  Constants.swift
//  pokemonTracker
//
//  Created by Leandro on 7/16/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import Foundation
import MapKit

struct Constants {

// MARK: constants
static let regionRadius: CLLocationDistance = 100 // region radius can be thought of as map zoom
static let initialLocation : CLLocation = CLLocation(latitude: 41.826820, longitude: -71.402931)

// MARK: constants for VCMapView
static let pinImageSize = CGSize(width: 50, height: 50)
static let pinCalloutOffset = CGPoint(x: -5, y: 5)


}