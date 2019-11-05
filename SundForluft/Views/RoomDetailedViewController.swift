//
//  RoomDetailedViewController.swift
//  SundForluft
//
//  Created by Kim Sandberg on 17/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import UIKit

//Am using Charts from

import Charts



class RoomDetailedViewController: UIViewController {
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion:    nil)
    }
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    @IBOutlet weak var roomLabel: UILabel!
    
    let graph = LineChartView()
    
    var room : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var dataPoints = ppmDatapointsDTO()
        roomLabel.text = room
        
        DAO.shared.getDataPointsForGraph(room: "thisRoom"){ (dataPoints) in
            DispatchQueue.main.async {
                print("dataPoints: \(dataPoints)")
                self.populateGraph(ppmDataPoints: dataPoints)
            }
        }
    }
    
    func populateGraph(ppmDataPoints : ppmDatapointsDTO) {
//        var ppmData = [Double]()
//        var ppmDates  = [String]()
        
        //put the different data into its respective arrays for
        //the viewmodel of Chart
//        for i in 0..<ppmDataPoints.count-1 {
//            ppmData.append(ppmDataPoints[i].state.value)
//            ppmDates.append(ppmDataPoints[i].state.at)
//        }
        
        
        //TODO need to put the dates on the x-axis
        
        
        //fill the data into values in the format of
        //the viewmodel
        let values = (0..<ppmDataPoints.data!.count-1).map { (i) -> ChartDataEntry in
            let val = ppmDataPoints.data![i].data!
            return ChartDataEntry(x: Double(i), y: val)
        }

        //create the different objects for the viewmodel
        let set1 = LineChartDataSet(entries: values, label: "ppm Målinger")
        let data = LineChartData(dataSet: set1)
        
        self.lineChartView.data = data
    }
}


