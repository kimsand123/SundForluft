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
    
    
    //let roomNames = ("room1", "room2", "room3")
    //let room = (-100...100)
    let roomNames = ["room1", "room2"]
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return roomNames.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return roomNames[row]
    }
    
    func selectPicker(withText text: String) {
        if let index = roomNames.firstIndex(of: text) {
            PedalRoomPicker.selectRow(index, inComponent: 0, animated: true)
        } else {
            print("text not found")
        }
    }
}
