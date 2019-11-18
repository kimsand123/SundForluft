//
//  Room.swift
//  SundForluft
//
//  Created by Kim Sandberg on 10/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation
import UIKit

class Room {
    
    var name: String
    
    init?( name: String){
        guard !name.isEmpty else {
            return nil
        }
        
        self.name = name
        
    }
    
}


