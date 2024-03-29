//
//  CommentDAO.swift
//  SundForluft
//
//  Created by Kim Sandberg on 07/11/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase

class CommentDAO {
    
    //static let shared = CommentDAO()
    
    public init(){
        
    }
    
    func writeComment(comment:CommentDTO){
        
        let db = Firestore.firestore()
        let settings = db.settings
        
        settings.isPersistenceEnabled=false
        
        db.collection("Comment").document().setData([
            "uniquePhoneID": comment.uniquePhoneID as Any,
            "comment": comment.comment as Any,
            "date": comment.date as Any,
            "ppm": comment.ppm as Any
        ]) { err in
                    if let err = err {
                        //print("Error writing document: \(err)")
                    } else {
                        //print("Document successfully written!")
                    }
                }
    }
    
    func getComments(uniquePhoneID:String, completionHandler: @escaping ([CommentDTO]) -> Void ){
        var comments = [CommentDTO]()
        let businessLogic=BusinessLogic()
        let db = Firestore.firestore()
        
        //Define the FireStore query
        let query = db.collection("Comment").whereField("uniquePhoneID", isEqualTo: uniquePhoneID).order(by: "date" , descending: false)
        
        //run the query and save the result in querySnapshot.
        query.getDocuments { (querySnapshot, err) in
            guard err == nil else {
                return
            }
            
            //For every key value pair in every document, unwrap the variable and append the document
            // to the comments array.
            if let docs = querySnapshot?.documents {
                for docSnapshot in docs {
                    var commentDTO = CommentDTO()

                    if let uniquePhoneID = docSnapshot.get("uniquePhoneID") as? String? {
                        commentDTO.uniquePhoneID = uniquePhoneID
                    }
                    if let comment = docSnapshot.get("comment") as! String? {
                        commentDTO.comment = comment
                    }
                    if let date = docSnapshot.get("date") as! String? {
                        let isoDate = businessLogic.formatDateFromISO(isoDate: date)
                        commentDTO.date = isoDate
                    }
                    if let ppm = docSnapshot.get("ppm") as! Double? {
                        commentDTO.ppm = ppm
                        
                    }
                    comments.append(commentDTO)
                }
                completionHandler(comments)
            }
        }
    }
}

