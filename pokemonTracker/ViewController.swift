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
    let initialLocation = CLLocation(latitude: 41.827141, longitude: -71.399656) // the longitude and latitude of the CIT

    // MARK: properties
    @IBOutlet weak var mapView: MKMapView! // the main mapview
    
    // called once the view has been loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerMapOnLocation(initialLocation)
        addPokemonToMap()
        mapView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

