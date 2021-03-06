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
    let overlayTransitioningDelegate = OverlayTransitioningDelegate()
    let sideOverlayTransitioningDelegate = SideOverlayTransitioningDelegate()

    
    // MARK: properties
    @IBOutlet weak var mapView: MKMapView! // the main mapview
    
    var locationManager = CLLocationManager()
    
    var mostRecentPinLocation : CLLocationCoordinate2D!
    var mostRecentTappedAnnotation : mapAnnotation!
    
    @IBOutlet weak var PinHolderImage: UIImageView!
    
    
    // called once the view has been loaded
    override public func viewDidLoad() {
        super.viewDidLoad()
        centerMapOnLocation(Constants.initialLocation)
        mapView.delegate = self
        let draggablePinLocation = CGPoint(x: PinHolderImage.center.x, y: PinHolderImage.center.y )
        let draggablePokeballPin = DraggablePokeballPin(location: draggablePinLocation)
        self.view.addSubview(draggablePokeballPin)
        draggablePokeballPin.delegate = self
        serverHelper.thisThing()
        
    
        
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
    
    public func createPokemonAnnotation(type : PokemonType, coordinate : CLLocationCoordinate2D) {
        mapView.addAnnotation(pokemonAnnotation(type: type, coordinate: mostRecentPinLocation))

    }
    
    
    public func createPokemonAnnotationAtMapCoordinate(coordinate : CLLocationCoordinate2D) {
        
    }
    
    
    // MARK : pin functions
    func getPinImage(annotation : MKAnnotation) -> UIImage {
        var pinImage : UIImage?
        
        //creates a bitmap image context, used for computing image resizing with the gpu
        UIGraphicsBeginImageContext(pinImageSize)
        
        //set the image based on the type and any further information
        if annotation is pokemonAnnotation {
            let annotation = annotation as! pokemonAnnotation
            pinImage = annotation.Type.image
        }
        
        // draw the chosen image in a correctly sized rectangle in the current graphics context
        pinImage!.drawInRect(CGRectMake(0, 0, pinImageSize.width, pinImageSize.height))
        
        // close the graphics context and return the image
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
    
    func initPinAddedPopup(screenPoint : CGPoint) {
        let mapPoint = self.view.convertPoint(screenPoint, toCoordinateSpace: mapView)
        mostRecentPinLocation = mapView.convertPoint(mapPoint, toCoordinateFromView: mapView)
//        let modalViewController = PinAddedPopUpViewViewController(coordinate : coordinate)
//        let navigationController = UINavigationController(rootViewController: modalViewController)
//        //navigationController.modalTransitionStyle = .FlipHorizontal
//        navigationController.modalPresentationStyle = .OverCurrentContext
//        self.presentViewController(navigationController, animated: true, completion: nil)
        
          //performSegueWithIdentifier("ShowPinAddedView", sender: nil)
        let overlayVC = storyboard?.instantiateViewControllerWithIdentifier("overlayViewController") as! PinAddedPopUpViewViewController!
        overlayVC.delegate = self
        overlayVC.coordinate = mostRecentPinLocation
        prepareOverlayVC(overlayVC)
        presentViewController(overlayVC, animated: true, completion: nil)

    }
    
    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPokemonAnnotationDetailView" {
            let destinationViewController : PokemonDetailView = segue.destinationViewController as! PokemonDetailView
            destinationViewController.annotation = mostRecentTappedAnnotation as? pokemonAnnotation
        }
    }
    private func prepareOverlayVC(overlayVC: UIViewController) {
        overlayVC.transitioningDelegate = overlayTransitioningDelegate
        overlayVC.modalPresentationStyle = .Custom
    }


}

