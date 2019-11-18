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
            "uniquePhoneID": comment.uniquePhoneID,
            "comment": comment.comment!,
            "date": comment.date,
            "ppm": comment.ppm
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func getComments(uniquePhoneID:String, completionHandler: @escaping ([CommentDTO]) -> Void ){
        var comments = [CommentDTO]()
        let businessLogic=BusinessLogic()
        let db = Firestore.firestore()
        let query = db.collection("Comment").whereField("uniquePhoneID", isEqualTo: uniquePhoneID).order(by: "date" , descending: false)
        
        query.getDocuments { (querySnapshot, err) in
            guard err == nil else {
                return
            }
            if let docs = querySnapshot?.documents {
                for docSnapshot in docs {
                    debugPrint(docSnapshot.get("uniquePhoneID")as! String)
                    let uniquePhoneID = docSnapshot.get("uniquePhoneID") as! String
                    let comment=(docSnapshot.get("comment") as! String)
                    let date=businessLogic.formatDateFromISO(isoDate: docSnapshot.get("date") as! String)
                    let ppm=docSnapshot.get("ppm") as! Double
                    let commentDTO = CommentDTO(uniquePhoneID: uniquePhoneID, comment: comment, date: date, ppm: ppm)
                    comments.append(commentDTO)
                }
                completionHandler(comments)
            }
        }
    }
}

