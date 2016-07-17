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
    let regionRadius: CLLocationDistance = 100 // region radius can be thought of as map zoom
    let initialLocation : CLLocation = CLLocation(latitude: 41.826820, longitude: -71.402931)
    
    // MARK: constants for VCMapView
    let pinImageSize = CGSize(width: 50, height: 50)
    let pinCalloutOffset = CGPoint(x: -5, y: 5)
    
    // MARK: properties
    @IBOutlet weak var mapView: MKMapView! // the main mapview
    var locationManager = CLLocationManager()
    
    // called once the view has been loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerMapOnLocation(initialLocation) // centers the map on a default location the cit in providence

        addPokemonToMap()
        mapView.delegate = self
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
    
    // MARK: mapping functions
    func centerMapOnLocation(location: CLLocation) {
        // region radius is in meters
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func addPokemonToMap() {
        let pokemonAnnotations = getPokemonAnnotations()
        mapView.addAnnotations(pokemonAnnotations)
    }
    
    // MARK: fake data
    func getPokemonAnnotations() -> [pokemonAnnotation] {
        let pokemon = pokemonAnnotation(pokemonName: "squirtle", coordinate: CLLocationCoordinate2D(latitude: 41.827141, longitude: -71.399656))
        return [pokemon]
    }

}

