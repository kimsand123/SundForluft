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
    
    private var businessLogic=BusinessLogic()
    static let shared = DAO()
    
    private var dat=Data()
    
    private init(){
        
    }
    
    public func getDataPointsForGraph(room: String) -> [ppmDatapointDTO] {
        var dataPoints=[ppmDatapointDTO]()
        var condition : Bool
        var counter : Int
        var tempDate:String = ""
        counter = 0
        condition = true
        let today = Date()
        
        //Getting the datapoints from backend with the room as search criteria.
        while(condition == true) {
            if let tempDate = Calendar.current.date(byAdding: .day, value: -100+counter, to: today){
                dataPoints.append(ppmDatapointDTO(value: Double(arc4random()), at: businessLogic.DateToString(date: tempDate)))
            }
        }
        counter = counter + 1
        if (counter > 99) {
            condition = false
        }
        return dataPoints
    }
    
    
    //Getting the last ppm for a room. Frontpage ppmLabel
    func getCurrentppm(room: String, completionHandler: @escaping (Double) -> Void ){
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
            // decode Json object
            
            //            if let usableData = data{
            //                print ("Com-Task done")
            //                completionHandler(usableData)
            //            } else {
            //                print("JSON ERROR \n\n\(responseString ?? "NO DATA")")
            //            }
            
            if let usableData = data {
                print ("UsableData: \(usableData)")
                var ppm:Double=0.0
                var dataPoints=[ppmDatapointDTO]()
                var dataPoint:ppmDatapointDTO
                let decoder = JSONDecoder()
                do {
                    dataPoints = try decoder.decode([ppmDatapointDTO].self, from: usableData)
//                    dataPoints.append(dataPoint)
//                    print("dataPoint: \(dataPoint)")
                    ppm = dataPoints[0].state.value
                } catch {
                    print (error.localizedDescription)
                }
                
                //                let json = JSON(usableData)
                //                //print (json)
                //                let row = json[0]
                //                let state = row["state"]
                //                let ppm = state["value"].
                print("ppm: \(ppm)")
                completionHandler(ppm)
                
            } else {
                print("JSON ERROR \n\n\(responseString ?? "NO DATA")")
            }
            
        }
        
        task.resume()
    }
    
}
