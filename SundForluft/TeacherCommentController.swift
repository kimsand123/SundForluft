//
//  TeacherCommentController.swift
//  SundForluft
//
//  Created by Kim Sandberg on 07/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import UIKit

class TeacherCommentController: UIViewController {
    var comments = [Comment]()
    @IBOutlet weak var commentTabelView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CustomCommentCell", bundle: nil)
        commentTabelView.register(nib,forCellReuseIdentifier:"CustomCommentCell")
            
        commentTabelView.dataSource = self as? UITableViewDataSource

        fillComments()
        
        // Do any additional setup after loading the view.
    }
    
    func fillComments() {
        let sampleComments = [
            Comment(ppm: 600, date: Date(), comment: "Dette er første commentar"),
            Comment(ppm: 600, date: Date(), comment: "Dette er anden commentar"),
            Comment(ppm: 700, date: Date(), comment: "Dette er tredje commentar"),
            Comment(ppm: 800, date: Date(), comment: "Dette er fjerde commentar"),
            Comment(ppm: 550, date: Date(), comment: "Dette er femte commentar"),
            Comment(ppm: 1300, date: Date(), comment: "Dette er sjette commentar"),
            Comment(ppm: 1433, date: Date(), comment: "Dette er syvende commentar"),
            Comment(ppm: 1384, date: Date(), comment: "Dette er ottende commentar"),
            Comment(ppm: 0943, date: Date(), comment: "Dette er niende commentar")
        ]
        comments = sampleComments.compactMap {$0}
        

      
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCommentCell", for: indexPath)
        
        var counter: Int
        counter = 1
        for comment in comments{
            print("kommentar nr. \(counter)  \(comment.comment)!")
            counter = counter + 1
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCommentCell") as? CustomCommentCell {
            cell.ppmLabel?.text = String(comments[indexPath.row].ppm)
            //df.stringFromDate(Date())
            cell.dateLabel?.text = df.string(from: comments[indexPath.row].date)
            cell.commentLabel?.text = comments[indexPath.row].comment
            
        }
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
