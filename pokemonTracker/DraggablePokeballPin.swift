//
//  DraggablePokeballPin.swift
//  pokemonTracker
//
//  Created by Leandro on 7/16/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import UIKit

class DraggablePokeballPin: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var lastLocation:CGPoint?
    var panRecognizer:UIPanGestureRecognizer?
    var origin:CGPoint
    var delegate:MainViewControllerProtocol?
    init(location:CGPoint) {
        UIGraphicsBeginImageContext(Constants.pinImageSize)
        
        
        let pinImage = UIImage(named: "GenericPokeball")!
        
        // draw the chosen image in a correctly sized rectangle in the current graphics context
        pinImage.drawInRect(CGRectMake(0, 0, Constants.pinImageSize.width, Constants.pinImageSize.height))
        
        // close the graphics context and return the image
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.origin = location

        super.init(image: resizedImage)
        self.userInteractionEnabled = true
        self.lastLocation = location
        self.panRecognizer = UIPanGestureRecognizer(target:self, action:#selector(DraggablePokeballPin.detectPan(_:)))
        self.gestureRecognizers = [panRecognizer!]
        self.frame = CGRect(x: location.x, y: location.y, width: Constants.pinImageSize.width, height: Constants.pinImageSize.height)
        self.center = origin

    }
    

    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func detectPan(recognizer:UIPanGestureRecognizer) {
        let translation  = recognizer.translationInView(self.superview!)
        self.center = CGPointMake(lastLocation!.x + translation.x, lastLocation!.y + translation.y)
        if recognizer.state == .Ended
        {
            // create a pokemon at the desired location
            delegate?.initPinAddedPopup(center)
            
            // recenter the image to the center
            center = origin
            


        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Promote the touched view
        self.superview?.bringSubviewToFront(self)
        
        // Remember original location
        lastLocation = self.center
    }
    

    
    
}
