//
//  Controller.swift
//  SundForluft
//
//  Created by Kim Sandberg on 24/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation
import SwiftyJSON

class BusinessLogic{
    
    init(){}
    
    
    func decodeJsonForppmValue(data:Data)-> Double {
        print ("Parsing JSON")
        
        let ppm = Double()
        let usableData = Data()
        
        print("Data : \(data)")
        if case usableData = data {
            let json = JSON(usableData)
            print (json)
            let row = json[0]
            let state = row["state"]
            if case ppm = state[0].double{}
            
            print(state)
            
        } else {
            print("JSON ERROR")
        }
        print ("Done parsing JSON")
        return ppm
    }
    
    func DateToString (date:Date)-> String{
        var dateString:String
        
        dateString = date.toString(dateFormat: "dd-MM")
        
        return dateString
    }
    
    
}

//from https://stackoverflow.com/questions/42524651/convert-nsdate-to-string-in-ios-swift
//Extends the Date class with a toString function
extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
