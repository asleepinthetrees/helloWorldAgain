//
//  PokemonDetailView.swift
//  pokemonTracker
//
//  Created by Luke Murray on 7/17/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import UIKit

class PokemonDetailView: UIViewController {
    
    var annotation : pokemonAnnotation?


    @IBOutlet weak var navItem: UINavigationItem!

    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navItem.title = annotation?.Type.rawValue
        
        pokemonImage.image = annotation?.Type.image
        view.layer.cornerRadius = 2.0
        view.layer.shadowColor = UIColor.blackColor().CGColor
        view.layer.shadowOffset = CGSizeMake(0, 0)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func BackToMapTapped(sender: UIBarButtonItem) {
        let x = presentingViewController
        print(x)
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
