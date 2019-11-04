//
//  studentDTO.swift
//  SundForluft
//
//  Created by Kim Sandberg on 04/11/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation

struct StudentDTO: Decodable {
    var id: String
    var studentData: data

    struct data: Decodable {
        var clas: String
        var firstName: String
        var lastName: String
        var school: String
    }
    
    init( id:String, clas:String, firstName:String, lastName:String, school:String) {
        self.id = id
        studentData = data(clas: clas, firstName:firstName, lastName: lastName, school: school)
    }
    
}
