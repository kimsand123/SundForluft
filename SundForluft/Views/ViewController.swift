//
//  ViewController.swift
//  SundForluft
//
//  Created by Kim Sandberg on 26/09/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ppmLabel: UILabel!
    @IBOutlet weak var ChallengeButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func challengeButton(_
        sender: Any) {
        
        //Change to LoggedInFrontViewController
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let challengeViewController = storyBoard.instantiateViewController(withIdentifier: "ChallengeViewController") as! ChallengeViewController
        challengeViewController.modalPresentationStyle = .fullScreen
        self.present(challengeViewController, animated: true, completion: nil)
    }
    
    let attDao = ATTDAO()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        // Do any additional setup after loading the view.
        
        ChallengeButton.titleLabel?.textAlignment = .center
        ChallengeButton.sizeToFit()
        ChallengeButton.layer.borderWidth = 2.0
        ChallengeButton.layer.borderColor = UIColor.blue.cgColor
        ChallengeButton.layer.cornerRadius = 10.0
        //print("calling API")
        
        attDao.getCurrentppm(){ (ppm) in
            //print ("PPM: \(ppm)")
            
            DispatchQueue.main.async {
                self.ppmLabel.text = String(ppm) + " ppm"
            }
        }
    }
}

