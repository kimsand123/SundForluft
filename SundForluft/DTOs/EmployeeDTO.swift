//
//  userDTO.swift
//  SundForluft
//
//  Created by Kim Sandberg on 21/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation

class EmployeeDTO {
    var firstName: String
    var lastName: String
    var userName: String
    var password: String
    var employment: String
    
    init() {
        userName = ""
        password = ""
        firstName = ""
        lastName = ""
        employment = ""
    }
}
