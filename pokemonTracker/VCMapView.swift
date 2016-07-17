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

    public func mapView(mapView: MKMapView, didUpdateUserLocation
        userLocation: MKUserLocation) {
        var region : MKCoordinateRegion = mapView.region
        region.center.latitude = userLocation.coordinate.latitude;
        region.center.longitude = userLocation.coordinate.longitude;
        mapView.setRegion(region, animated:true)
    }
    
    public func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
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
                
                //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.OpenPinTappedView(_:)))
                //view.addGestureRecognizer(tapGesture)
            }

            return view
        }
        return nil
    }
    
    

    
    
}