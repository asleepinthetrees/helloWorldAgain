//
//  ViewController.swift
//  pokemonTracker
//
//  Created by Luke Murray on 7/16/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    // MARK: constants
    let regionRadius: CLLocationDistance = Constants.regionRadius // region radius can be thought of as map zoom
    let initialLocation : CLLocation = Constants.initialLocation
    
    // MARK: constants for VCMapView
    let pinImageSize = Constants.pinImageSize
    let pinCalloutOffset = Constants.pinCalloutOffset
    
    // MARK: properties
    @IBOutlet weak var mapView: MKMapView! // the main mapview
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var PinHolderImage: UIImageView!
    // called once the view has been loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerMapOnLocation(initialLocation) // centers the map on a default location the cit in providence

        addPokemonToMap()
        mapView.delegate = self
        let draggablePinLocation = CGPoint(x: PinHolderImage.center.x, y: PinHolderImage.center.y )
        self.view.addSubview(DraggablePokeballPin(location: draggablePinLocation))
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - location manager to authorize user location for Maps app
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    


}

