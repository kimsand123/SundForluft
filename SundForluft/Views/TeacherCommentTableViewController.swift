//
//  TeacherCommentTableViewController.swift
//  SundForluft
//
//  Created by Kim Sandberg on 10/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import UIKit

class TeacherCommentTableViewController: UITableViewController {
    
    var businessLogic:BusinessLogic?=nil
    var compactedComments=[CommentDTO]()
    var commentDao = CommentDAO()

    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillComments()
    }
    
    // MARK: - Table view data source
    func fillComments() {
        
        commentDao.getComments(uniquePhoneID: UIDevice.current.identifierForVendor!.uuidString){ (comments) in
            DispatchQueue.main.async {
                self.compactedComments = comments.compactMap {$0}
                self.tableView.reloadData()
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return compactedComments.count
    }
    
    //This function is called for every row and fills the data into the labels
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let df = DateFormatter()
        df.dateStyle = .short
        df.timeStyle = .short
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCommentCell", for: indexPath) as! CustomCommentCell
        cell.ppmLabel?.text = String(compactedComments[indexPath.row].ppm)
        cell.dateLabel?.text = compactedComments[indexPath.row].date
        cell.commentLabel?.text = compactedComments[indexPath.row].comment
        return cell
    }
}
