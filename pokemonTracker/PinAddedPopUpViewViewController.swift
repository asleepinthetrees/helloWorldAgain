//
//  PinAddedPopUpViewViewController.swift
//  pokemonTracker
//
//  Created by Luke Murray on 7/17/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import UIKit
import MapKit

class PinAddedPopUpViewViewController: UITableViewController{
    
    
    // MARK : properties
    var pokemonArray = PokemonType.allValues
    let searchController = UISearchController(searchResultsController: nil)
    var filteredPokemonArray = [PokemonType]()
    var delegate: MainViewControllerProtocol!
    var coordinate: CLLocationCoordinate2D!
    
    
    // MARK: - View Setup
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up search bar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        view.layer.cornerRadius = 5.0
        view.layer.shadowColor = UIColor.blackColor().CGColor
        view.layer.shadowOffset = CGSizeMake(0, 0)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table View
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Either returns the count of the total pokemon array or the filtered pokemon array depending
    //on if the search controller is active and the text of the search bar is not empty
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredPokemonArray.count
        }
        return pokemonArray.count
    }
    
    //Either returns the data from the total pokemon array or the filtered pokemon array depending
    //on if the search controller is active and the text of the search bar is not empty
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let candy: String
        if searchController.active && searchController.searchBar.text != "" {
            candy = filteredPokemonArray[indexPath.row].rawValue
        } else {
            candy = pokemonArray[indexPath.row].rawValue
        }
        cell.textLabel?.text = candy
        return cell
    }
    
    //filters the pokmon based on the search text and adds pokemon to filtered list
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredPokemonArray = pokemonArray.filter { candy in
            return candy.rawValue.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }
    
    // occurs whenever an item is clicked
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow!
        
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell
        let pokemonType = PokemonType(rawValue: currentCell.textLabel!.text!)
        delegate?.createPokemonAnnotation(pokemonType!, coordinate: coordinate)
        print(currentCell.textLabel!.text  )
        //dismissViewControllerAnimated(true, completion: nil)
        presentingViewController!.dismissViewControllerAnimated(true, completion: nil)

    }
    
    
}

extension PinAddedPopUpViewViewController: UISearchResultsUpdating {
    //Whenever the text of the search bar changes, this method is called to refilter the list of pokemon
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
