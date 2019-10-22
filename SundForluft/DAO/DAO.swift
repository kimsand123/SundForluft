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
    
    private var dat = Data()
    
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
    
    //Getting the last ppm for a room. Frontpage ppmLabel
    func getCurrentppm(room: String) -> ppmDTO {
        var currentppm = ppmDTO()
        
        // Define server URL
        let scriptUrl = "https://api.allthingstalk.io/"
        // Add parameters and endpoints
        let urlWithParameters = scriptUrl + "device/6nGZdUDfxK8DR3XgqY7G9McY/assets"
        // Create NSURL Object
        let myUrl = NSURL(string: urlWithParameters);
        // Create URL Request
        let request = NSMutableURLRequest(url:myUrl! as URL);
        // Set request HTTP method.
        request.httpMethod = "GET"
        // Add the authorization header and token
        request.addValue("Bearer 4GJSKorDcNh8W1VeVufmMNzJEhm3aw26Fsov2NJ", forHTTPHeaderField: "Authorization")
        
        // Excute Request and JSON conversion
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            print ("Com-task started")
            // Check for error
            if error != nil
            {
                print("error=\(String(describing: error))")
                return
            }
            
            // Print out response string and other result variables
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //            print("data = \(data)  \n\n")
            //            print("responseString = \(responseString)  \n\n")
            //            print("response = \(response)\n\n")
            //            print("error = \(error)")
            
            
            // Update the UI on the main thread
            DispatchQueue.main.async {
                
                if let usableData = data {
                    var ppm = Double()
                    
                    let json = JSON(usableData)
                    let row = json[0]
                    let state = row["state"]
                    if case ppm = state[0].double{}
                    //ViewController.reloadData(ppm)
                    print(state)
                } else {
                    print("JSON ERROR \n\n\(responseString ?? "NO DATA")")
                }
            }
        }
        print ("Com-Task done")
        task.resume()
        return currentppm
    }
}
