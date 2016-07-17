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
    
    init(imageIcon: UIImage?, location:CGPoint) {
        super.init(image: imageIcon)
        self.userInteractionEnabled = true
        self.lastLocation = location
        self.panRecognizer = UIPanGestureRecognizer(target:self, action:#selector(DraggablePokeballPin.detectPan(_:)))
        self.center = location
        self.gestureRecognizers = [panRecognizer!]
        self.frame = CGRect(x: location.x, y: location.y, width: 20.0, height: 30.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func detectPan(recognizer:UIPanGestureRecognizer) {
        let translation  = recognizer.translationInView(self.superview!)
        self.center = CGPointMake(lastLocation!.x + translation.x, lastLocation!.y + translation.y)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Promote the touched view
        self.superview?.bringSubviewToFront(self)
        
        // Remember original location
        lastLocation = self.center
    }
    
    
    
}
