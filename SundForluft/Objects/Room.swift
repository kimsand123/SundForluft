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
    var cloudImage: UIImage
    var room: String
    
    init?(cloudImage: UIImage, room: String){
        guard !room.isEmpty else {
            return nil
        }
        
        self.cloudImage = cloudImage
        self.room = room
        
    }
    
}


