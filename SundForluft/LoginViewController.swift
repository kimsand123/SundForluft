//
//  LoginViewController.swift
//  SundForluft
//
//  Created by Kim Sandberg on 26/09/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
    //print(AppState.getLoggedState())
        
    //print(AppState.getLoggedState())

        
    }
    
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.dismiss(animated: true, completion: nil)
        if sender as? UIButton == loginButton {
            AppState.setLoggedState(loggedstate: true)
            
            //self.dismiss(animated: true, completion: nil)
            
            

            
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     
    }


    
    
}
