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
        
        //print("Data : \(data)")
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
    
    // from https://stackoverflow.com/questions/48867030/swift-iso8601-format-to-date
    func getDateInISOFormat(date:Date)->String{
        
        let dateFormatter = ISO8601DateFormatter()
        
        
        dateFormatter.formatOptions = [
            .withYear,
            .withMonth,
            .withDay,
            .withTime,
            .withTimeZone,
            .withColonSeparatorInTime
        ]
        return dateFormatter.string(from: date)
    }
    
    func formatDateFromISO(isoDate:String)->String  {
        
        let yearArray = isoDate.components(separatedBy: CharacterSet(charactersIn: "TZ"))
        
        
        let year = getSubstring(string: yearArray[0], fromIndex: 0, toIndex: 3)!
        let month = getSubstring(string: yearArray[0],fromIndex: 4,toIndex: 5)!
        let day = getSubstring(string: yearArray[0], fromIndex: 6, toIndex: 7)!
        
        let timeArray = yearArray[1].components(separatedBy: ":")
        
        let hours = timeArray[0]
        let minutes = timeArray[1]
        //let seconds = timeArray[2]
        
        var dateResult = day + "-" + month + "-" + year
        dateResult = dateResult + "  kl. " + hours + ":" + minutes
        return dateResult
    }
    
    //https://stackoverflow.com/questions/39677330/how-does-string-substring-work-in-swift/39677704
    func getSubstring(string: String, fromIndex: Int, toIndex: Int) -> String? {
        if fromIndex < toIndex && toIndex < string.count {
            let startIndex = string.index(string.startIndex, offsetBy: fromIndex)
            let endIndex = string.index(string.startIndex, offsetBy: toIndex)
            let returnString = String(string[startIndex...endIndex])
            return returnString
        }else{
            return nil
        }
    }
    
    func gettingNewDate(date:Date, daysFrom:Int) -> Date{
        let currentDate = date
        var dateCmpt = DateComponents()
        dateCmpt.day = daysFrom
        let resultDate = Calendar.current.date(byAdding: dateCmpt, to: currentDate)
        return resultDate!
    }
    
    func formatDateForSearch(date:String) -> String {
        let yearArray = date.components(separatedBy: CharacterSet(charactersIn: "TZ"))
    
        let year = getSubstring(string: yearArray[0], fromIndex: 0, toIndex: 3)!
        let month = getSubstring(string: yearArray[0],fromIndex: 4,toIndex: 5)!
        let day = getSubstring(string: yearArray[0], fromIndex: 6, toIndex: 7)!
        
        let resultDate = year + "-" + month + "-" + day
        
        return resultDate
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
