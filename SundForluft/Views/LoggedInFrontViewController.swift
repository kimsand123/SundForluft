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
        
        let attDao = ATTDAO()
        let commentDao = CommentDAO()
        //instantier og initialiser alert
        
        
        let alert = UIAlertController(title: "Kommentar", message: "Indtast kommentar ", preferredStyle: UIAlertController.Style.alert )
        
        //What happens when pressing Færdig
        let save = UIAlertAction(title: "Færdig", style: .default) { (alertAction) in
            let commentaryTextField = alert.textFields![0] as UITextField
            
            if commentaryTextField.text != "" {
                let businessLogic = BusinessLogic()
                let ppm:Double=0.0
                var commentary = CommentDTO(uniquePhoneID: UIDevice.current.identifierForVendor!.uuidString, comment: commentaryTextField.text!, date: businessLogic.getDateInISOFormat(date: Date()), ppm: ppm)
                
                
                attDao.getCurrentppm(){ (ppm) in
                    //print ("comment PPM: \(ppm)")
                    commentary.ppm = ppm
                    commentDao.writeComment(comment: commentary)
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
        
        //What happens when pressing cancel
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
        //Round corners AND border on buttons
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
