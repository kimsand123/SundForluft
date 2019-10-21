//
//  RoomDetailedViewController.swift
//  SundForluft
//
//  Created by Kim Sandberg on 17/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import UIKit

//Am using the ILG chart from
//https://iosexample.com/interactive-line-graph-ios-chart-library/
import Charts



class RoomDetailedViewController: UIViewController {
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion:    nil)
    }
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    @IBOutlet weak var roomLabel: UILabel!
    
    let graph = LineChartView()
    
    
    var ppmDataCluster = [ppmDTO]()
    
    var room : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roomLabel.text = room
       
        
        ppmDataCluster = DAO.shared.getDataPointsForGraph(room: room)
        
        for data in ppmDataCluster {
            print ("ppm \(data.ppm)  date \(data.date) \n")
            
        }
        
        populateGraph(ppmDataCluster: ppmDataCluster)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func populateGraph(ppmDataCluster : [ppmDTO]) {
        var ppmData = [Double]()
        var ppmDates  = [Date]()
        
        for i in 0..<ppmDataCluster.count-1 {
            ppmData.append(ppmDataCluster[i].ppm)
            //print ("i = \(i) ppmData = \(ppmData[i]) dataCluster = \(ppmDataCluster[i].ppm) ")
        }
        
        let values = (0..<ppmDataCluster.count-1).map { (i) -> ChartDataEntry in
            let val = ppmDataCluster[i].ppm
             return ChartDataEntry(x: Double(i), y: val)
        }
        
        
//        let values = (0..<length).map { (i) -> ChartDataEntry in
//            let val = Double(arc4random_uniform(UInt32(length))+3)
//            return ChartDataEntry(x: Double(i), y: val)
//        }
//
        //        for dataItem in ppmDataCluster {
        //            ppmData.append(dataItem.ppm)
        //            ppmDates.append(dataItem.date)
        //            }
        //
        
        let set1 = LineChartDataSet(entries: values, label: "ppm Målinger")
        let data = LineChartData(dataSet: set1)
        
        self.lineChartView.data = data
        
    }
    
    
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


