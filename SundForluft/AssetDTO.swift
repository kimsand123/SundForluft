//
//  AssetDTO.swift
//  SundForluft
//
//  Created by Kim Sandberg on 15/11/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation

struct AssetDTO: Decodable {
    var name: String?
    var description: String?
    var id: String?
    
    init?() {
        return nil
    }
}
