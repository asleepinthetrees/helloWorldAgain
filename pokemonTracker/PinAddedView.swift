//
//  PinAddedView.swift
//  pokemonTracker
//
//  Created by Luke Murray on 7/17/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import Foundation
import MapKit

import UIKit

@IBDesignable
class PinAddedView: UIView {
    
    //MARK : Properties
    var Title : String!
    
    
    
    var Coordinate : CLLocationCoordinate2D?
    var delegate:MainViewControllerProtocol?
    
    //MARK : UIElements
    
    //MARK : Initialization
    init(frame: CGRect, coordinate: CLLocationCoordinate2D) {
        super.init(frame: frame)
        
        // initialize the properties
        Title = "hello"
        Coordinate = coordinate
        
        // setup the view
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // setup the view
        setup()
    }
    
    
    func setup() {
        self.backgroundColor=UIColor.grayColor()
        self.layer.cornerRadius=25
        self.layer.borderWidth=2
    }
    
    //MARK : Textbox
    
}