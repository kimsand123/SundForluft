//
//  Comment.swift
//  SundForluft
//
//  Created by Kim Sandberg on 05/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation

class Comment {
    var ppm: Int
    var date: Date
    var comment: String
    
    init?(ppm: Int, date: Date, comment: String) {
        
        guard !comment.isEmpty else {
            return nil
        }
        
        self.ppm = ppm
        self.date = date
        self.comment = comment
    
    }
}
