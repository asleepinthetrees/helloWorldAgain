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

    @IBOutlet weak var pokemonImage: UIImageView!
    
    @IBOutlet weak var topBarChartView: BarChartView!
    
    @IBOutlet weak var bottomBarChartView: BarChartView!
    
    
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
        
        setUpTopChart()
        setUpBottomChart()
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
    
    func setUpTopChart(){
        topBarChartView.delegate = self
        topBarChartView.descriptionText = ""
        
        topBarChartView.xAxis.drawAxisLineEnabled = false
        topBarChartView.xAxis.drawGridLinesEnabled = false
        
        topBarChartView.xAxis.drawLabelsEnabled = false
        
        topBarChartView.leftAxis.drawGridLinesEnabled = false
        topBarChartView.leftAxis.drawLabelsEnabled = false
        
        topBarChartView.rightAxis.drawGridLinesEnabled = false
        topBarChartView.rightAxis.drawLabelsEnabled = false
        
        topBarChartView.leftAxis.drawZeroLineEnabled = true
        
        topBarChartView.leftAxis.drawTopYLabelEntryEnabled = false
        topBarChartView.rightAxis.drawTopYLabelEntryEnabled = false
        topBarChartView.noDataText = "No data provided"
        topBarChartView.doubleTapToZoomEnabled = false
        topBarChartView.pinchZoomEnabled = false
        topBarChartView.legend.enabled = false
        topBarChartView.bounds = CGRect(x: 0,y: 0,width: 400,height: 80)
        topBarChartView.borderLineWidth = 0
        topBarChartView.leftAxis.axisMaxValue = 1.5
        topBarChartView.rightAxis.axisMaxValue = 1.5
        topBarChartView.leftAxis.axisMinValue = 0
        topBarChartView.rightAxis.axisMinValue = 0


    }
    func setUpBottomChart(){
        bottomBarChartView.delegate = self
        bottomBarChartView.descriptionText = ""
        
        bottomBarChartView.xAxis.drawAxisLineEnabled = false
        bottomBarChartView.xAxis.drawGridLinesEnabled = false
        
        bottomBarChartView.xAxis.drawLabelsEnabled = false
        
        bottomBarChartView.leftAxis.drawGridLinesEnabled = false
        bottomBarChartView.leftAxis.drawLabelsEnabled = false
        
        bottomBarChartView.rightAxis.drawGridLinesEnabled = false
        bottomBarChartView.rightAxis.drawLabelsEnabled = false
        
        //bottomBarChartView.leftAxis.drawZeroLineEnabled = true
        
        bottomBarChartView.leftAxis.drawTopYLabelEntryEnabled = false
        bottomBarChartView.rightAxis.drawTopYLabelEntryEnabled = false
        bottomBarChartView.noDataText = "No data provided"
        bottomBarChartView.doubleTapToZoomEnabled = false
        bottomBarChartView.pinchZoomEnabled = false
        bottomBarChartView.legend.enabled = false
        bottomBarChartView.bounds = CGRect(x: 0,y: 10,width: 330,height: 90)
        bottomBarChartView.borderLineWidth = 0
        bottomBarChartView.leftAxis.axisMinValue = -1.5
        bottomBarChartView.rightAxis.axisMinValue = -1.5
        bottomBarChartView.leftAxis.axisMaxValue = 0
        bottomBarChartView.rightAxis.axisMaxValue = 0

    }
    
    func setChartData(votes : [Vote]) {
        
        topBarChartView.animate(xAxisDuration: 0.5, yAxisDuration: 0.4)
        bottomBarChartView.animate(xAxisDuration: 0.5, yAxisDuration: 0.4)
        

        var topDataEntries: [BarChartDataEntry] = []
        var bottomDataEntries: [BarChartDataEntry] = []

        
        let startTime = annotation?.InitialTime
        let currentTime = NSDate()
        let timeInterval = currentTime.timeIntervalSinceDate(startTime!)
        for vote in votes {
            let value = vote.Vote == VoteType.Yes ? 1.0 : -1.0
            let index = Int((vote.Time.timeIntervalSinceDate(startTime!) / timeInterval) * 30)
            
            let dataEntry = BarChartDataEntry(value: value, xIndex: index)
            
            if dataEntry.value>0 {
                topDataEntries.append(dataEntry)
            }
            else{
                bottomDataEntries.append(dataEntry)
            }
            
        }
        
        let xVals = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
        
        let topChartDataSet = BarChartDataSet(yVals: topDataEntries, label: "")
        topChartDataSet.axisDependency = ChartYAxis.AxisDependency.Left
        topChartDataSet.setColor(UIColor.greenColor())
        let topChartData = BarChartData(xVals: xVals, dataSet: topChartDataSet)

        topChartData.setDrawValues(false)
        
        
        topBarChartView.data = topChartData
        
        let bottomChartDataSet = BarChartDataSet(yVals: bottomDataEntries, label: "")
        topChartDataSet.axisDependency = ChartYAxis.AxisDependency.Left

        bottomChartDataSet.setColor(UIColor.redColor())
        let bottomChartData = BarChartData(xVals: xVals, dataSet: bottomChartDataSet)
        bottomChartData.setDrawValues(false)
        
        bottomBarChartView.data = bottomChartData
        
        
    }

}
