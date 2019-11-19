//
//  LoggedInFrontViewController.swift
//  SundForluft
//
//  Created by Kim Sandberg on 27/09/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import UIKit

class LoggedInFrontViewController: UIViewController {
    
    @IBOutlet weak var tilbageButton: UIBarButtonItem!
    @IBAction func tilbageButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var schoolStatistics: UIButton!
    
    @IBOutlet weak var commentaryButton: UIButton!
    
    @IBOutlet weak var teachCommentaryButton: UIButton!
    
    @IBAction func commentaryButton(_ sender: Any) {
        
        let attDao = ATTDAO()
        let commentDao = CommentDAO()
        //instantier og initialiser alert
        
        let titleString = NSLocalizedString("Kommentar", comment: "title on the comment entry alert")
        let messageString = NSLocalizedString("Indtast kommentar", comment: "Lead text in the commentary entry box")
        
        
        let alert = UIAlertController(title: titleString, message: messageString, preferredStyle: UIAlertController.Style.alert )
        
        //What happens when pressing Færdig
        let buttonText = NSLocalizedString("Færdig", comment: "The done button in the commentary popup")
        let save = UIAlertAction(title: buttonText, style: .default) { (alertAction) in
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
            commentaryTextField.placeholder = titleString
            commentaryTextField.textColor = .black
        }
        
        alert.addAction(save)
        let cancelString = NSLocalizedString("Fortryd", comment: "the cancel text in the commentary alert")
        //What happens when pressing cancel
        let cancel = UIAlertAction(title: cancelString, style: .default) { (alertAction) in }
        alert.addAction(cancel)
        self.present(alert, animated:true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        let commentaryButtonString = NSLocalizedString("Lærer kommentarer", comment: "Text for the teacher commentaries button")
        teachCommentaryButton.setTitle (commentaryButtonString, for: .normal)
        
        let statisticsString = NSLocalizedString("Skole statistik", comment: "text for the school statistics button")
        schoolStatistics.setTitle(statisticsString, for: .normal)
        
        let enterCommentString = NSLocalizedString("Tryk for kommentar", comment: "the press for commentary button")
        commentaryButton.setTitle(enterCommentString, for: .normal)
        
        let tilbageButtonString = NSLocalizedString("Tilbage", comment: "the backbutton text")
        let tilbageButton = UIBarButtonItem(title: tilbageButtonString, style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        
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
