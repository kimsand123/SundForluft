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
import ILG

class RoomDetailedViewController: UIViewController {

    var ppmDataCluster = [ppmDTO]()
    let graphView = InteractiveLineGraphView()
    var room : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateGraph(ppmDataCluster: DAO.shared.getDataPointsForGraph(room: room))
        
        // Do any additional setup after loading the view.
    }
    
    func populateGraph(ppmDataCluster : [ppmDTO]) {
        var ppmData = [Double]()
        var ppmDates  = [Date]()
        let length = ppmDataCluster.count
        
        for dataItem in ppmDataCluster {
            ppmData.append(dataItem.ppm)
            ppmDates.append(dataItem.date)
            
            
            graphView.update(withDataPoints: ppmData, animated: true)
            graphView.
            
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

}
