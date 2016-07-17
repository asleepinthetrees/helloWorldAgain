//
//  MainViewControllerProtocol.swift
//  pokemonTracker
//
//  Created by Luke Murray on 7/17/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import Foundation
import UIKit
protocol MainViewControllerProtocol {
    func createPokemonAnnotationAtScreenCoordinate(location : CGPoint)
    func initPinAddedPopup(location : CGPoint)
}