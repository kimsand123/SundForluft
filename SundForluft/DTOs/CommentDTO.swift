//
//  CommentDTO.swift
//  SundForluft
//
//  Created by Kim Sandberg on 04/11/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation


struct CommentDTO: Decodable {
    var id: String
    var collection: data

    struct data: Decodable {
        var value: String
        var comment: String
        var date: String
    }
    
    init( id:String, value:String, comment:String, date:String) {
        self.id = id
        collection = data(value: value, comment: comment, date: date)
    }
    
}
