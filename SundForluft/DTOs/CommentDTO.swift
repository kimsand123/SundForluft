//
//  CommentDTO.swift
//  SundForluft
//
//  Created by Kim Sandberg on 04/11/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation


struct CommentDTO: Decodable {
    var uniquePhoneID: String
    var comment: String?
    var date: String
    var ppm: Double
    
    
    init(uniquePhoneID:String, comment:String, date:String, ppm:Double) {
        self.uniquePhoneID = uniquePhoneID
        self.comment = comment
        self.date = date
        self.ppm = ppm
    }
}

