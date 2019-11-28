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
    var id: String
    var state: data

    struct data: Decodable {
        var value: Double
        var at: String
    }
    
    init( id:String, value:Double, at:String) {
        self.id = id
        state = data(value: value, at: at)
    }
}
