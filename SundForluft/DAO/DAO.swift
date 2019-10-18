//
//  DAO.swift
//  SundForluft
//
//  Created by Kim Sandberg on 17/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation
//This is defined as a singleton so to access its
//funcitons you write DAO.shared.<function>

class DAO{
    
    static let shared = DAO()
    
    private init(){
        
    }
    
    public func getDataPointsForGraph(room: String) -> [ppmDTO] {
        var dataPoints = [ppmDTO]()
        var condition : Bool
        var counter : Int
        counter = 0
        condition = true
        
        
        let today = Date()
        
        //Getting the datapoints from backend with the room as search criteria.
        while(condition == true) {
            var dataPoint = ppmDTO()
            dataPoint.ppm = Double(arc4random())
            dataPoint.date = Calendar.current.date(byAdding: .day, value: -100+counter, to: today)!
            dataPoints.append(dataPoint)
            
            counter = counter + 1
            if (counter > 99) {
                condition = false
            }
        }
        
        
        return dataPoints
    }
    
}
