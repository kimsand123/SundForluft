//
//  RoomDetailedViewController.swift
//  SundForluft
//
//  Created by Kim Sandberg on 17/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import UIKit

//Am using Charts from
//https://github.com/danielgindi/Charts
//Inspiration drawn from
//https://www.iosapptemplates.com/blog/swift-programming/ios-charts-swift
//

import Charts

class RoomDetailedViewController: UIViewController {
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion:    nil)
    }
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var roomLabel: UILabel!
    
    let graph = LineChartView()
    var businessLogic = BusinessLogic()
    var attDao = ATTDAO()
    
    var room : String = ""
    var id : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roomLabel.text = room
        
        //Get data from the last 14 days
        let fromDate = businessLogic.getDateInISOFormat(date: businessLogic.gettingNewDate(date: Date(), daysFrom: -14))
        let toDate = businessLogic.getDateInISOFormat(date: Date())
        
        //Getting data for the graph, sending a closure with the return parameter datapoints to be executed when the data is fetched. Let the mainQueue update the UI with the collected data
        attDao.getDataPointsForGraph(id: id, fromDate: fromDate, toDate: toDate){ (dataPoints) in
            DispatchQueue.main.async {
                print("dataPoints: \(dataPoints)")
                self.populateGraph(ppmDataPoints: dataPoints)
            }
        }
    }
    
    func populateGraph(ppmDataPoints : ppmDatapointsDTO) {
        
        //fill the data into the values object
        let values = (0..<ppmDataPoints.data!.count-1).map { (i) -> ChartDataEntry in
            let val = ppmDataPoints.data![i].data!
            return ChartDataEntry(x: Double(i), y: val)
        }

        //create the different objects for the chart
        let chartLabel = NSLocalizedString("ppm Målinger", comment:"Label on the ppm chart in the detailed viewcontroller")
        
        let set1 = LineChartDataSet(entries: values, label: chartLabel)
        let data = LineChartData(dataSet: set1)
        
        //present the chart
        self.lineChartView.data = data
    }
}


