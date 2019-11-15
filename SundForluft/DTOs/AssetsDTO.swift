//
//  AssetsDTO.swift
//  SundForluft
//
//  Created by Kim Sandberg on 15/11/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation


struct AssetsDTO: Decodable {
    var data: [asset]?

    struct asset: Decodable {
        var name: String?
        var description: String?
    }
    
    init?() {
        return nil
    }
}
