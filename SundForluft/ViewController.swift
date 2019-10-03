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
        self.navigationItem.setHidesBackButton(true, animated:true);
        // Do any additional setup after loading the view.
    }


}

