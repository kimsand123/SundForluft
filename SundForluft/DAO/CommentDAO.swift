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
            "date": comment.date
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}
