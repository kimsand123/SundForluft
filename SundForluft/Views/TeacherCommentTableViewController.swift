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

    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillComments()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    func fillComments() {
        
        CommentDAO.shared.getComments(uniquePhoneID: UIDevice.current.identifierForVendor!.uuidString){ (comments) in
            DispatchQueue.main.async {
                self.compactedComments = comments.compactMap {$0}
                self.tableView.reloadData()
                
            }
        }
        
        
        
        //        let sampleComments =
        //            [CommentDTO(ppm: 600, date: businessLogic?.getDateInISOFormat(), comment: "Dette er første commentar", ppm: 850.0),
        //            CommentDTO(ppm: 600, date: businessLogic?.getDateInISOFormat(), comment: "Dette er anden commentar", ppm: 850.0),
        //            CommentDTO(ppm: 700, date: businessLogic?.getDateInISOFormat(), comment: "Dette er tredje commentar", ppm: 850.0),
        //            CommentDTO(ppm: 800, date: businessLogic?.getDateInISOFormat(), comment: "Dette er fjerde commentar", ppm: 850.0),
        //            CommentDTO(ppm: 550, date: businessLogic?.getDateInISOFormat(), comment: "Dette er femte commentar", ppm: 850.0),
        //            CommentDTO(ppm: 1300, date: businessLogic?.getDateInISOFormat(), comment: "Dette er sjette commentar", ppm: 850.0),
        //            CommentDTO(ppm: 1433, date: businessLogic?.getDateInISOFormat(), comment: "Dette er syvende commentar", ppm: 850.0),
        //            CommentDTO(ppm: 1384, date: businessLogic?.getDateInISOFormat(), comment: "Dette er ottende commentar", ppm: 850.0),
        //            CommentDTO("2", comment: "Dette er niende commentar", date: businessLogic?.getDateInISOFormat(), ppm: 850.0)]
        
        
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return compactedComments.count
    }
    
    //Denne funktion bliver kaldt for hver celle
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let df = DateFormatter()
        df.dateStyle = .short
        df.timeStyle = .short
        //df.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCommentCell", for: indexPath) as! CustomCommentCell
        cell.ppmLabel?.text = String(compactedComments[indexPath.row].ppm)
        //df.stringFromDate(Date())
        cell.dateLabel?.text = compactedComments[indexPath.row].date
        cell.commentLabel?.text = compactedComments[indexPath.row].comment
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
