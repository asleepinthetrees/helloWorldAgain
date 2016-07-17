//
//  ViewController.swift
//  pokemonTracker
//
//  Created by Luke Murray on 7/16/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import UIKit
import MapKit

public class ViewController: UIViewController, CLLocationManagerDelegate, MainViewControllerProtocol {

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
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        centerMapOnLocation(initialLocation) // centers the map on a default location the cit in providence

        addPokemonToMap()
        mapView.delegate = self
        let draggablePinLocation = CGPoint(x: PinHolderImage.center.x, y: PinHolderImage.center.y )
        let draggablePokeballPin = DraggablePokeballPin(location: draggablePinLocation)
        self.view.addSubview(draggablePokeballPin)
        draggablePokeballPin.delegate = self
        //serverHelper.GetRequest()
        
    }
    
    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }

    override public func didReceiveMemoryWarning() {
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
    
    public func createPokemonAnnotationAtScreenCoordinate(location : CGPoint) {
        let mapPoint = self.view.convertPoint(location, toCoordinateSpace: mapView)
        let location = mapView.convertPoint(mapPoint, toCoordinateFromView: mapView)
        createPokemonAnnotationAtMapCoordinate(location)
    }
    
    public func createPokemonAnnotationAtMapCoordinate(coordinate : CLLocationCoordinate2D) {
        
        mapView.addAnnotation(pokemonAnnotation(pokemonName: "test", coordinate: coordinate))
    }
    
    
    // MARK : pin functions
    func getPinImage(annotation : MKAnnotation) -> UIImage {
        var pinImage : UIImage?
        
        //creates a bitmap image context, used for computing image resizing with the gpu
        UIGraphicsBeginImageContext(pinImageSize)
        
        //set the image based on the type and any further information
        if(annotation is pokemonAnnotation) {
            pinImage = UIImage(named: "GenericPokeball")!
        }
        
        // draw the chosen image in a correctly sized rectangle in the current graphics context
        pinImage!.drawInRect(CGRectMake(0, 0, pinImageSize.width, pinImageSize.height))
        
        // close the graphics context and return the image
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
    
    func OpenPinTappedView(annotation : mapAnnotation) {
        let customView = PinTappedView(frame: CGRect(x: 50, y: 50, width: 200, height: 200), annotation: annotation)
        
        view.addSubview(customView)
    }
    
    func initPinAddedPopup(location : CGPoint) {
        let mapPoint = self.view.convertPoint(location, toCoordinateSpace: mapView)
        let location = mapView.convertPoint(mapPoint, toCoordinateFromView: mapView)
        let popUp=PinAddedView(frame: CGRectMake(50,
                                self.view.frame.size.height/4,
                                self.view.frame.size.width - 100,
                                500), coordinate : location)
        self.view.addSubview(popUp)
    }
    
    // MARK: fake data
    func getPokemonAnnotations() -> [pokemonAnnotation] {
        let pokemon = pokemonAnnotation(pokemonName: "squirtle", coordinate: CLLocationCoordinate2D(latitude: 41.827141, longitude: -71.399656))
        return [pokemon]
    }
    
    func addPokemonToMap() {
        let pokemonAnnotations = getPokemonAnnotations()
        mapView.addAnnotations(pokemonAnnotations)
    }


}

