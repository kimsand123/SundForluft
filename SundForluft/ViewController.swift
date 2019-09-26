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
    
    @IBOutlet weak var ButtonStack: UIStackView!
    @IBOutlet weak var ChallengeButton: UIButton!
    
    @IBOutlet weak var ppmLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        let screenMinX =
        ppmLabel.text = String(Int(screenHeight))
        var X_Position:CGFloat = 0.0 //use your X position here
        var Y_Position:CGFloat = 50.0 //use your Y position here
        ChallengeButton.frame= CGRectMake(X_Position, Y_Position, screenWidth, CGFloat(Int(screenHeight) / 3))
        ChallengeButton.frame.size = CGSize(width: Int(screenWidth), height: Int(Int(screenHeight) / 3))
        // Do any additional setup after loading the view.
    }


}

