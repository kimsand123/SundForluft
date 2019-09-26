//
//  ViewController.swift
//  SundForluft
//
//  Created by Kim Sandberg on 26/09/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logButton: UIBarButtonItem!
    
    @IBOutlet weak var ChallengeButton: UIButton!
    
    @IBOutlet weak var ppmLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        ppmLabel.text = String(Int(screenHeight))
        //ChallengeButton.heightAnchor = screenHeight / 4
        // Do any additional setup after loading the view.
    }


}

