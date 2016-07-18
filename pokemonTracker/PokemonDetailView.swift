//
//  PokemonDetailView.swift
//  pokemonTracker
//
//  Created by Luke Murray on 7/17/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import UIKit
import Charts

class PokemonDetailView: UIViewController, ChartViewDelegate {
    
    var annotation : pokemonAnnotation?



    @IBOutlet weak var navItem: UINavigationItem!

    @IBOutlet weak var barChartView: BarChartView!
    
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
        
        // setup the line chart
        self.barChartView.delegate = self
        self.barChartView.descriptionText = "Tap node for details"
        self.barChartView.descriptionTextColor = UIColor.whiteColor()
        self.barChartView.gridBackgroundColor = UIColor.darkGrayColor()
        setChartData((annotation?.Votes)!)
        
    }

    @IBAction func OnUpvoteTouchUp(sender: UIButton) {
        annotation?.AddUpVote(NSDate())
        setChartData((annotation?.Votes)!)
    }
    
    @IBAction func OnDownvoteTouchUp(sender: UIButton) {
        annotation?.AddDownVote(NSDate())
        setChartData((annotation?.Votes)!)
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
    
    func setChartData(votes : [Vote]) {
        
        barChartView.animate(xAxisDuration: 0.5, yAxisDuration: 0.5)
        barChartView.xAxis.drawAxisLineEnabled = false
        barChartView.xAxis.drawGridLinesEnabled = false

        barChartView.xAxis.drawLabelsEnabled = false

        barChartView.leftAxis.drawGridLinesEnabled = false
        barChartView.leftAxis.drawLabelsEnabled = false
        
        barChartView.rightAxis.drawGridLinesEnabled = false
        barChartView.rightAxis.drawLabelsEnabled = false
        
        barChartView.leftAxis.drawZeroLineEnabled = true
        
        barChartView.leftAxis.drawTopYLabelEntryEnabled = false
        barChartView.rightAxis.drawTopYLabelEntryEnabled = false



        //barChartView.leftAxis.drawZeroLineEnabled = false
        self.barChartView.noDataText = "No data provided"
        barChartView.doubleTapToZoomEnabled = false
        barChartView.pinchZoomEnabled = false
        barChartView.legend.enabled = false

        var dataEntries: [BarChartDataEntry] = []
        
        let startTime = annotation?.InitialTime
        let currentTime = NSDate()
        let timeInterval = currentTime.timeIntervalSinceDate(startTime!)
        for vote in votes {
            let value = vote.Vote == VoteType.Yes ? 1.0 : -1.0
            let index = Int((vote.Time.timeIntervalSinceDate(startTime!) / timeInterval) * 10)
            
            var dataEntry = BarChartDataEntry(value: value, xIndex: index)
            if dataEntries.contains(dataEntry){
                dataEntry = BarChartDataEntry(value: Double(dataEntry.value+1), xIndex: index)
            }
            dataEntries.append(dataEntry)
            
        }
        
        let xVals = [1,2,3,4,5,6,7,8,9,10]
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Votes")
        let chartData = BarChartData(xVals: xVals, dataSet: chartDataSet)
        chartData.setDrawValues(false)
        
        barChartView.data = chartData
    }

}
