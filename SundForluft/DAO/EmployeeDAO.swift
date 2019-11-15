//
//  TeacherDAO.swift
//  SundForluft
//
//  Created by Kim Sandberg on 04/11/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase

class EmployeeDAO {
    private var businessLogic=BusinessLogic()
    static let shared = EmployeeDAO()
    
    private var dat=Data()
    
    private init(){
    }
    
//    func getEmployee(userName:String, password:String)-> EmployeeDTO{
//        var employee=EmployeeDTO()
//        let db = Firestore.firestore()
//        let settings = db.settings
//        settings.isPersistenceEnabled=false
//        
//        db.collection("Employee")
//            .whereField("userName" , isEqualTo: userName)
//            .whereField("password" , isEqualTo: password )
//            .getDocuments{ (querySnapshot, err) in
//                print("********** getDocuments")
//                
//                if let err = err {
//                    print("Error getting employee: \(err)")
//                } else {
//                    for document in querySnapshot!.documents {
//                        print("Document data:  \(document.data())")
//                    }
//                    
//                }
//        }
//       
//        return employee
//    }
}
