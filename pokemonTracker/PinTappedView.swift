//
//  PinTappedView.swift
//  pokemonTracker
//
//  Created by Luke Murray on 7/16/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import Foundation

import UIKit
class PinTappedView: UIView {
    
    //MARK : Properties
    var Title : String!
    
    //MARK : Initialization
    required init(frame: CGRect, annotation : mapAnnotation ) {
        super.init(frame: frame)
        // initialize the properties
        Title = annotation.title
        
        // setup the view
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup() {
        backgroundColor = UIColor.blueColor()
        
        // set the title
        let textView = UITextView(frame: CGRect(x: 5, y: 5, width: 200, height: 50))
        textView.text = Title
        self.addSubview(textView)
    }
    
    //MARK : Textbox
    
}