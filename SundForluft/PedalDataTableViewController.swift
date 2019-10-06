//
//  PedalDataTableViewController.swift
//  SundForluft
//
//  Created by Konstantin Orlov on 03/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation
import UIKit

class PedalDataTableViewController: UITableViewController{
    
    @IBOutlet weak var PedalStatusLabel: UILabel!
    @IBOutlet weak var Pedalstatusimage: UIImage!
    @IBOutlet weak var picker: UIPickerView!
    
    let roomNames = ["room1", "room2", "room3", "room4", "room5"]
    //var pickerData: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.picker.delegate = self
        self.picker.dataSource = self
        self.view.addSubview(picker)
        
        PedalStatusLabel.numberOfLines = 0
        PedalStatusLabel.lineBreakMode = .byWordWrapping
        PedalStatusLabel.font = UIFont.boldSystemFont(ofSize: 24)
        PedalStatusLabel.textColor = UIColor.black
        PedalStatusLabel.shadowColor = UIColor.lightGray
        PedalStatusLabel.shadowOffset = CGSize (width: 2, height: 4)
        PedalStatusLabel.center = self.view.center
        
        PedalStatusLabel.text = "test test"
 }

}

 extension PedalDataTableViewController: UIPickerViewDataSource {
    // number of components. Checked
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // lines in  components
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return roomNames.count
    }
    
}
    
extension PedalDataTableViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return roomNames[row]
    }
    

func selectPicker(withText text: String) {
    if let index = roomNames.firstIndex(of: text) {
        picker.selectRow(index, inComponent: 0, animated: true)
    } else {
        print("text not found")
    }
}

}
      
