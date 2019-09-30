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
    
    @IBAction func Dismiss(sender: AnyObject) {
        self.dismiss(animated: true, completion: {});//This is intended to dismiss the Info sceen.
    
        func buttonClicked(){
            AppState.setLoggedState(loggedstate: true)
        }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "LoggedInFrontViewController {
            let destinationVC = seque.destination as? LoggedInFrontViewController
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
