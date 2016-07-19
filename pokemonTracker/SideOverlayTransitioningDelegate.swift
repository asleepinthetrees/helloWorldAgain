//
//  SideOverlayTransitioningDelegate.swift
//  pokemonTracker
//
//  Created by Leandro on 7/17/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import UIKit

class SideOverlayTransitioningDelegate : NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    var presenting:Bool = true;
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.8
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        // get reference to our fromView, toView and the container view that we should perform the transition in
        let container = transitionContext.containerView()
        

        
        if self.presenting == true {
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
            container!.addSubview(toView)
            
            // set up from 2D transforms that we'll use in the animation
            let offScreenLeft = CGAffineTransformMakeTranslation(-container!.frame.width + 30, 0)
            
            // get the duration of the animation
            // DON'T just type '0.5s' -- the reason why won't make sense until the next post
            // but for now it's important to just follow this approach
            //let duration = self.transitionDuration(transitionContext)
            let duration = 0.3


            UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.8, options: [], animations: {
                
                // slide fromView off either the left or right edge of the screen
                // depending if we're presenting or dismissing this view

                toView.transform = offScreenLeft
                }, completion: { finished in
                    
                    // tell our transitionContext object that we've finished animating
                    transitionContext.completeTransition(true)
                    
            })
        }
        else {
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!

            container!.addSubview(fromView)
            
            // set up from 2D transforms that we'll use in the animation
            let offScreenRight = CGAffineTransformMakeTranslation(container!.frame.width, 0)
            
            // get the duration of the animation
            // DON'T just type '0.5s' -- the reason why won't make sense until the next post
            // but for now it's important to just follow this approach
            let duration = self.transitionDuration(transitionContext)

            UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.8, options: [], animations: {
                
                // slide fromView off either the right
                    fromView.transform = offScreenRight
                
                }, completion: { finished in
                    // tell our transitionContext object that we've finished animating
                    transitionContext.completeTransition(true)
            })
        }
        
        
       
        
    }
    
    func presentationControllerForPresentedViewController(presented: UIViewController,
                                                          presentingViewController presenting: UIViewController,
                                                                                   sourceViewController source: UIViewController) -> UIPresentationController? {
        
        return SideOverlayPresentationController(presentedViewController: presented,
                                             presentingViewController: presenting)
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController)-> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
    
}