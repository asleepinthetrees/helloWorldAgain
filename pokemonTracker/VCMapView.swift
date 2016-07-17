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
            // else create a new document
            } else {
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                
                // let the pin show a callout bubble
                view.canShowCallout = true
                
                // offset the callout from the pin
                view.calloutOffset = pinCalloutOffset
                
                // set the image of the pin
                view.image = getPinImage(annotation)
                view.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure) as UIView
            }

            return view
        }
        return nil
    }
    
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
    
    
//    func mapView(mapView: MKMapView?, annotationView view: MKAnnotationView?,
//                 calloutAccessoryControlTapped control: UIControl?) {
//        let location = view.annotation as! Artwork
//        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
//        location.mapItem().openInMapsWithLaunchOptions(launchOptions)
//    }
}