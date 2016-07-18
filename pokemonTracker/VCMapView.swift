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
                
                view.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
                
            }

            return view
        }
        return nil
    }
    
    public func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotation = view.annotation as? pokemonAnnotation {
            mostRecentTappedAnnotation = annotation
            //performSegueWithIdentifier("showPokemonAnnotationDetailView", sender: nil)
            let overlayVC = storyboard?.instantiateViewControllerWithIdentifier("showPokemonAnnotationDetailView") as! PokemonDetailView!
            overlayVC.annotation = mostRecentTappedAnnotation as? pokemonAnnotation
            prepareSideOverlayVC(overlayVC)
            presentViewController(overlayVC, animated: true, completion: nil)
            
        }
    }
    private func prepareSideOverlayVC(overlayVC: UIViewController) {
        overlayVC.transitioningDelegate = sideOverlayTransitioningDelegate
        overlayVC.modalPresentationStyle = .Custom
        
    }

    
    
}