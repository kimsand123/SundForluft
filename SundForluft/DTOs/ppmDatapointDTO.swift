//
//  ppmDTO.swift
//  SundForluft
//
//  Created by Kim Sandberg on 17/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//
//"state" : {
//  "value" : 800,
//  "at" : "2019-10-19T14:56:35.69Z"
//}


import Foundation

struct ppmDatapointDTO: Decodable {
    var state:data

    struct data: Decodable {
        var value: Double
        var at: String
    }
    
    init(value:Double, at:String) {
        state = data(value: value, at: at)
    }
    
}
