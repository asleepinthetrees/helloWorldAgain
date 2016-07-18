//
//  OverlayTransitioningDelegateOverlayTransitioningDelegate.swift
//  pokemonTracker
//
//  Created by Leandro on 7/17/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import UIKit

class OverlayTransitioningDelegate : NSObject, UIViewControllerTransitioningDelegate {
    
    func presentationControllerForPresentedViewController(presented: UIViewController,
                                                          presentingViewController presenting: UIViewController,
                                                                                   sourceViewController source: UIViewController) -> UIPresentationController? {
        
        return OverlayPresentationController(presentedViewController: presented,
                                             presentingViewController: presenting)
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController)-> UIViewControllerAnimatedTransitioning? {
        return BouncyViewControllerAnimator()
    }
    
}
