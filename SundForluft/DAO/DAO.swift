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
        
        //Getting the datapoints from backend with the room as search criteria.
        
        
        
        return dataPoints
    }
    
}
