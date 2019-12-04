//
//  Controller.swift
//  SundForluft
//
//  Created by Kim Sandberg on 24/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation

class BusinessLogic{
    
    init(){}
    
    //Create a specific dateformatting from a Date object.
    func DateToString (date:Date)-> String{
        var dateString:String
        dateString = date.toString(dateFormat: "dd-MM")
        return dateString
    }
    
    // from https://stackoverflow.com/questions/48867030/swift-iso8601-format-to-date
    // Create ISO date from a Date object
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
        
        //Split the isoDate into its date part and its timepart
        let yearArray = isoDate.components(separatedBy: CharacterSet(charactersIn: "TZ"))
        let year = getSubstring(string: yearArray[0], fromIndex: 0, toIndex: 3)!
        let month = getSubstring(string: yearArray[0],fromIndex: 4,toIndex: 5)!
        let day = getSubstring(string: yearArray[0], fromIndex: 6, toIndex: 7)!
        
        //Split the timepart of a Date into its value components
        let timeArray = yearArray[1].components(separatedBy: ":")
        
        let hours = timeArray[0]
        let minutes = timeArray[1]
        //let seconds = timeArray[2]
        
        //Format the date as desired.
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
    
    //Getting a date that is days away from a Date object
    func gettingNewDate(date:Date, daysFrom:Int) -> Date{
        let currentDate = date
        var dateCmpt = DateComponents()
        dateCmpt.day = daysFrom
        let resultDate = Calendar.current.date(byAdding: dateCmpt, to: currentDate)
        return resultDate!
    }
    
    //Format a date string into a search format.
    func formatDateForSearch(date:String) -> String {
        //seperate the date into its components of the date part and the time part and
        //return the date in the desired format
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
