//
//  ppmDatapoints.swift
//  SundForluft
//
//  Created by Kim Sandberg on 24/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation

struct ppmDatapointsDTO: Decodable {

    var data: [dataPoints]?

    struct dataPoints: Decodable {
        var at: String?
        var data: Double?        
    }
}
