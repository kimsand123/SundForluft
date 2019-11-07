//
//  LoggedInFrontViewController.swift
//  SundForluft
//
//  Created by Kim Sandberg on 27/09/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import UIKit

class LoggedInFrontViewController: UIViewController {
    
    @IBOutlet weak var schoolStatistics: UIButton!
    @IBOutlet weak var teachCommentaryButton: UIButton!
    @IBAction func commentaryButton(_ sender: Any) {
        
        //instantier og initialiser alert
        
        
        let alert = UIAlertController(title: "Kommentar", message: "Indtast kommentar ", preferredStyle: UIAlertController.Style.alert )
        
        //Hvad skal der ske når man trykker færdig
        let save = UIAlertAction(title: "Færdig", style: .default) { (alertAction) in
            let commentaryTextField = alert.textFields![0] as UITextField
            
            if commentaryTextField.text != "" {
                let commentDAO = CommentDAO()
                let businessLogic = BusinessLogic()
                
                let comment = CommentDTO(uniquePhoneID: UIDevice.current.identifierForVendor!.uuidString, comment: commentaryTextField.text!, date: businessLogic.getDateInISOFormat())
                
                debugPrint("comment.date  : \(comment.date )")
                commentDAO.writeComment(comment: comment)
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
        teachCommentaryButton.titleLabel?.textAlignment = .center
        teachCommentaryButton.sizeToFit()
        teachCommentaryButton.layer.borderWidth = 2.0
        teachCommentaryButton.layer.borderColor = UIColor.blue.cgColor
        teachCommentaryButton.layer.cornerRadius = 10.0
        
        schoolStatistics.titleLabel?.textAlignment = .center
        schoolStatistics.sizeToFit()
        schoolStatistics.layer.borderWidth = 2.0
        schoolStatistics.layer.borderColor = UIColor.blue.cgColor
        schoolStatistics.layer.cornerRadius = 10.0
    }
}
