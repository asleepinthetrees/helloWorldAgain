//
//  VCMapView.swift
//  pokemonTracker
//
//  Created by Luke Murray on 7/16/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import Foundation


import MapKit

extension ViewController: MKMapViewDelegate {

    func mapView(mapView: MKMapView, didUpdateUserLocation
        userLocation: MKUserLocation) {
        var region : MKCoordinateRegion = mapView.region
        region.center.latitude = userLocation.coordinate.latitude;
        region.center.longitude = userLocation.coordinate.longitude;
        mapView.setRegion(region, animated:true)
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation
        {
            // Don't proceed with custom pin view
            return nil
        }
        
        // if the annotation is a pokemon annotation
        if let annotation = annotation as? pokemonAnnotation {
            // identifier used to identify views which can be reused
            let identifier = "pokemon"
            var view: MKAnnotationView
            // if there is a view we can reuse then reuse that
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as MKAnnotationView! {
                dequeuedView.annotation = annotation
                view = dequeuedView
            // else create a new annotation view
            } else {
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                
                // let the pin show a callout bubble
                view.canShowCallout = true
                
                // offset the callout from the pin
                view.calloutOffset = pinCalloutOffset
                
                // set the image of the pin
                view.image = getPinImage(annotation)
                
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.OpenPinTappedView(_:)))
                view.addGestureRecognizer(tapGesture)
            }

            return view
        }
        return nil
    }
    
    // MARK: mapping functions
    func centerMapOnLocation(location: CLLocation) {
        // region radius is in meters
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    class func createPokemonAnnotationAtScreenCoordinate(location : CGPoint) {
        
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