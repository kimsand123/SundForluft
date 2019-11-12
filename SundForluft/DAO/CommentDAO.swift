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
    
    func getComments(uniquePhoneID:String)-> [CommentDTO]{
        var comments = [CommentDTO]()
        var counter:Int=0
        let db = Firestore.firestore()
        let query = db.collection("Comments").whereField("uniquePhoneID", isEqualTo: UIDevice.current.identifierForVendor!.uuidString).order(by: "date" , descending: false)
        
        // or
        // query = db.collection("animal").whereField("colors", arrayContains: "Black")
        // to filter data by an array value
        query.getDocuments { (querySnapshot, err) in
            if let docs = querySnapshot?.documents {
                for docSnapshot in docs {
                    
                    debugPrint(docSnapshot.get("uniquePhoneID"))
                    comments[counter].uniquePhoneID=docSnapshot.get("uniquePhoneID") as! String
                    comments[counter].comment=(docSnapshot.get("comment") as! String)
                    comments[counter].date=docSnapshot.get("date") as! String
                    comments[counter].ppm=docSnapshot.get("ppm") as! Double
                    counter=counter+1
                }
            }
            
            
        }
        return comments
    }
}
