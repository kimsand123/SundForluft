//
//  ViewController.swift
//  SundForluft
//
//  Created by Kim Sandberg on 26/09/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var ChallengeButton: UIButton!
    
    @IBAction func loginButton(_ sender: Any) {
        
        
        //instantier og initialiser alert
        let alert = UIAlertController(title: "Log ind", message: "Indtast brugernavn og password", preferredStyle: UIAlertController.Style.alert )
        
        //Hvad skal der ske når man trykker færdig
        let save = UIAlertAction(title: "Færdig", style: .default) { (alertAction) in
            let usernameTextField = alert.textFields![0] as UITextField
            let passwordTextField = alert.textFields![1] as UITextField
            
            if usernameTextField.text != "" {
                //Read TextFields text data
                
                
            } else {
                print("Brugernavn er tomt")
            }
            
            if passwordTextField.text != "" {
                
            } else {
                print("Password er tomt")
            }
            
            //Skift til LoggedInFrontViewController
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let loggedInFrontViewController = storyBoard.instantiateViewController(withIdentifier: "LoggedInFrontViewController") as! LoggedInFrontViewController
            loggedInFrontViewController.modalPresentationStyle = .fullScreen
            self.present(loggedInFrontViewController, animated: true, completion: nil)
            
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
        
        //Hvad skal der ske ved cancel
        let cancel = UIAlertAction(title: "Fortryd", style: .default) { (alertAction) in }
        alert.addAction(cancel)
        
        
        self.present(alert, animated:true, completion: nil)
        
        
        
    }
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func challengeButton(_
        sender: Any) {
        //Skift til LoggedInFrontViewController
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let challengeViewController = storyBoard.instantiateViewController(withIdentifier: "ChallengeViewController") as! ChallengeViewController
        challengeViewController.modalPresentationStyle = .fullScreen
        self.present(challengeViewController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        // Do any additional setup after loading the view.
    }
    
    
    
}

