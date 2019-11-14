//
//  LoggedInFrontViewController.swift
//  SundForluft
//
//  Created by Kim Sandberg on 27/09/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import UIKit

class LoggedInFrontViewController: UIViewController {
    
    @IBAction func tilbageButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var schoolStatistics: UIButton!
    @IBOutlet weak var teachCommentaryButton: UIButton!
    @IBAction func commentaryButton(_ sender: Any) {
        
        //instantier og initialiser alert
        
        
        let alert = UIAlertController(title: "Kommentar", message: "Indtast kommentar ", preferredStyle: UIAlertController.Style.alert )
        
        //Hvad skal der ske når man trykker færdig
        let save = UIAlertAction(title: "Færdig", style: .default) { (alertAction) in
            let commentaryTextField = alert.textFields![0] as UITextField
            
            if commentaryTextField.text != "" {
                let businessLogic = BusinessLogic()
                
                //getting the aktual date in ISO format
                //debugPrint("comment.date  : \(comment.date )")
                //Write to FireStore
                
                let ppm2:Double=0.0
                
                var commentary = CommentDTO(uniquePhoneID: UIDevice.current.identifierForVendor!.uuidString, comment: commentaryTextField.text!, date: businessLogic.getDateInISOFormat(), ppm: ppm2)
                
                ATTDAO.shared.getCurrentppm(room: "thisRoom"){ (ppm) in
                    print ("comment PPM: \(ppm)")
                    commentary.ppm = ppm
                    CommentDAO.shared.writeComment(comment: commentary)
                }
                
                
                
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
