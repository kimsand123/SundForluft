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
    
    @IBAction func loginButton(_ sender: Any) {
        
        var okToLogin : Bool
        okToLogin = false
        
        //Instantiate and initialize alert
        let alert = UIAlertController(title: "Log ind", message: "Indtast brugernavn og password", preferredStyle: UIAlertController.Style.alert )
        
        //What should happen when you press færdig
        let save = UIAlertAction(title: "Færdig", style: .default) { (alertAction) in
            let usernameTextField = alert.textFields![0] as UITextField
            let passwordTextField = alert.textFields![1] as UITextField
            
            while okToLogin == false {
                if usernameTextField.text != "" {
                    okToLogin = true
                } else {
                    usernameTextField.placeholder = "Du har ikke indtaste Brugernavn"
                    usernameTextField.textColor = .red
                    okToLogin = false
                }
                
                if passwordTextField.text != "" {
                    okToLogin = true
                    
                } else {
                    okToLogin = false
                }
            }
            
            if okToLogin == true {
                //Change to LoggedInFrontViewController
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let loggedInFrontViewController = storyBoard.instantiateViewController(withIdentifier: "LoggedInFrontViewController") as! LoggedInFrontViewController
                loggedInFrontViewController.modalPresentationStyle = .fullScreen
                self.present(loggedInFrontViewController, animated: true, completion: nil)
            }
        }
        
        //brugernavn
        alert.addTextField { (usernameTextField) in
            usernameTextField.placeholder = "Brugernavn"
            usernameTextField.textColor = .black
        }
        
        //password
        alert.addTextField { (passwordTextField) in
            passwordTextField.placeholder = "Password"
            passwordTextField.textColor = .black
            passwordTextField.isSecureTextEntry = true
        }
        
        alert.addAction(save)
        
        //What should happen when pressing cancel
        let cancel = UIAlertAction(title: "Fortryd", style: .default) { (alertAction) in }
        alert.addAction(cancel)
        
        
        self.present(alert, animated:true, completion: nil)
        
        
        
        
    }
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func challengeButton(_
        sender: Any) {
        
        //Change to LoggedInFrontViewController
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let challengeViewController = storyBoard.instantiateViewController(withIdentifier: "ChallengeViewController") as! ChallengeViewController
        challengeViewController.modalPresentationStyle = .fullScreen
        self.present(challengeViewController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        // Do any additional setup after loading the view.
        
        ChallengeButton.titleLabel?.textAlignment = .center
        ChallengeButton.sizeToFit()
        ChallengeButton.layer.borderWidth = 2.0
        ChallengeButton.layer.borderColor = UIColor.blue.cgColor
        ChallengeButton.layer.cornerRadius = 10.0
        print("calling API")
        
        DAO.shared.getCurrentppm(room: "thisRoom"){ (ppm) in
            print ("PPM: \(ppm)")
            
            DispatchQueue.main.async {
                self.reloadData(ppm: ppm)
            }
        }
    }
    
    func reloadData(ppm: Double){
        ppmLabel.text = String(ppm) + " ppm"
        print("done updating UI")
    }
}

