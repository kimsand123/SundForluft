//
//  LoggedInFrontViewController.swift
//  SundForluft
//
//  Created by Kim Sandberg on 27/09/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import UIKit

class LoggedInFrontViewController: UIViewController {
    
    @IBAction func commentaryButton(_ sender: Any) {
        
        //instantier og initialiser alert
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = "dd-MM-yyyy'T'hh:mm"
        date: String = dateFormatter.Date
        
        
        
        
        let alert = UIAlertController(title: "Kommentar" + date, message: "Indtast kommentar ", preferredStyle: UIAlertController.Style.alert )
        
        //Hvad skal der ske når man trykker færdig
        let save = UIAlertAction(title: "Færdig", style: .default) { (alertAction) in
            let commentaryTextField = alert.textFields![0] as UITextField
            
            if commentaryTextField.text != "" {
            } else {
                print("Der er ingen kommentar")
            }
        }
        
        //kommentar
        alert.addTextField { (commentaryTextField) in
            commentaryTextField.placeholder = "Kommentar"
            commentaryTextField.textColor = .black
        }
        
        alert.addAction(save)
        
        //Hvad skal der ske ved cancel
        let cancel = UIAlertAction(title: "Fortryd", style: .default) { (alertAction) in }
        alert.addAction(cancel)
        
        
        self.present(alert, animated:true, completion: nil)
    }
    
    @IBAction func logOutButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        // Do any additional setup after loading the view.
    }
}
