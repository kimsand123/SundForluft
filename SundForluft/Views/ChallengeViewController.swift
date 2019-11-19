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
        let cv = SAConfettiView(frame: self.view.bounds)
        cv.type = .Star
        let rect = CGRect(x:Int(self.view.bounds.maxX * 0.1), y:Int(self.view.bounds.maxY * 0.1), width:Int(self.view.frame.size.width), height:Int(self.view.frame.size.height))
        cv.frame = rect
        self.view.addSubview(cv)
        cv.startConfetti()
        infoLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        infoLabel.numberOfLines = 0
        
        // Do any additional setup after loading the view.
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
