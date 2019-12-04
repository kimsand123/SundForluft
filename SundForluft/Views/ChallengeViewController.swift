//
//  ChallengeViewController.swift
//  SundForluft
//
//  Created by Kim Sandberg on 27/09/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import UIKit
import SAConfettiView

class ChallengeViewController: UIViewController {
@IBOutlet weak var infoLabel: UILabel!
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //https://github.com/sudeepag/SAConfettiView
        let cv = SAConfettiView(frame: self.view.bounds)
        cv.type = .Star
        let rect = CGRect(x:Int(self.view.bounds.maxX * 0.1), y:Int(self.view.bounds.maxY * 0.1), width:Int(self.view.frame.size.width), height:Int(self.view.frame.size.height))
        cv.frame = rect
        
        //add the confettiview as a subview to
        self.view.addSubview(cv)
        cv.startConfetti()
        
        //getting a lot of test, multiple lines, to fit inside the infolabel
        infoLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        infoLabel.numberOfLines = 0
        
        // Do any additional setup after loading the view.
    }
}
