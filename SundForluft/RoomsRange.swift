//
//  RoomsRange.swift
//  SundForluft
//
//  Created by Konstantin Orlov on 03/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation
import UIKit
    
class RoomsRange: NSObject {
    let values = (-100...100).map {$0}
}

/*
extension TemperatureRange: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
 
} */
