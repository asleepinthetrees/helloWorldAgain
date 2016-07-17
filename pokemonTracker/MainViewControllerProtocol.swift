//
//  MainViewControllerProtocol.swift
//  pokemonTracker
//
//  Created by Luke Murray on 7/17/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import Foundation
import UIKit
import MapKit
protocol MainViewControllerProtocol {
    func createPokemonAnnotation(type : PokemonType, coordinate : CLLocationCoordinate2D)
    func initPinAddedPopup(location : CGPoint)
}