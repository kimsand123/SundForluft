//
//  DAO.swift
//  SundForluft
//
//  Created by Kim Sandberg on 17/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation
import SwiftyJSON
//This is defined as a singleton so to access its
//funcitons you write DAO.shared.<function>

class DAO{
    
    weak var responder : DownloadResponder?
    
    static let shared = DAO()
    
    private init(){
    }
    
    public func getDataPointsForGraph(room: String) -> [ppmDTO] {
        var dataPoints = [ppmDTO]()
        var condition : Bool
        var counter : Int
        counter = 0
        condition = true
        
        
        let today = Date()
        
        //Getting the datapoints from backend with the room as search criteria.
        while(condition == true) {
            //make new instance everytime as dataPoint is a reference and that
            //sees to it that it is a reference to a new instance for each iteracin.
            //It will be cleaned up by housekeeping
            var dataPoint = ppmDTO()
            dataPoint.ppm = Double(arc4random())
            dataPoint.date = Calendar.current.date(byAdding: .day, value: -100+counter, to: today)!
            dataPoints.append(dataPoint)
            
            counter = counter + 1
            if (counter > 99) {
                condition = false
            }
        }
        
        
        return dataPoints
    }
    
    
    //Getting the current ppm for a room. Frontpage ppmLabel
    func getCurrentppm(room: String) -> ppmDTO {
        var currentppm = ppmDTO()
        
        // Define server side script URL
        let scriptUrl = "https://api.allthingstalk.io/"
        // Add GroundID
        let urlWithDeviceID = scriptUrl + "device/6nGZdUDfxK8DR3XgqY7G9McY/assets"
        
        // Create NSURL Ibject
        let myUrl = NSURL(string: urlWithDeviceID);
        
        // Creaste URL Request
        let request = NSMutableURLRequest(url:myUrl! as URL);
        
        // Set request HTTP method to GET.
        request.httpMethod = "GET"
        
        // Add the authorization header and token
        request.addValue("Bearer 4GJSKorDcNh8W1VeVufmMNzJEhm3aw26Fsov2NJ", forHTTPHeaderField: "Authorization")
        
        // Excute HTTP Request
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            print ("task started")
            // Check for error
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // Print out response string and other result variables
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//            print("data = \(data)  \n\n")
//            print("responseString = \(responseString)  \n\n")
//            print("response = \(response)\n\n")
//            print("error = \(error)")
            
            
            // Convert server json response to data that i can use
            
            if let usableData = data {
                let json = JSON(usableData)
                let row = json[0]
                
                let state = row["state"]
                if case currentppm.ppm = state[0].double{}
                // notify download complete!
                let defaultCenter = NotificationCenter.default
                defaultCenter.post(name: NSNotification.Name(rawValue: "CompleteDownloadNotification"),
                object: nil,
                userInfo: nil)
                print(state)
            
            }
        }
        print ("Task done")
        task.resume()
        
        return currentppm
    }
}
