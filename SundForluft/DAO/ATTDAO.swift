//
//  ATTDAO.swift
//  SundForluft
//
//  Created by Kim Sandberg on 17/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation
import SwiftyJSON
//This is defined as a singleton so to access its
//funcitons you write ATTDAO.shared.<function>

class ATTDAO{
    
    private var businessLogic=BusinessLogic()
    static let shared = ATTDAO()
    
    private var dat=Data()
    
    private init(){
        
    }
    
    func getDataPointsForGraph(room: String, completionHandler: @escaping (ppmDatapointsDTO) -> Void ){
        var dataPoints=ppmDatapointsDTO()
        
        // Define server URL
        let scriptUrl = "https://api.allthingstalk.io/"
        // Add parameters and endpoints
        let urlWithParameters = scriptUrl + "asset/ZAYH4hpm6vhMGvCKEcHhNqA8/states?from=2019-10-10T12:11:19+0100&to=2019-10-31T12:11:19"
//       let urlWithParameters = scriptUrl + "asset/ZAYH4hpm6vhMGvCKEcHhNqA8/states?to=10%2F31%2F2019%2012%3A11%3A19"
        
        // Create NSURL Object
        let myUrl = NSURL(string: urlWithParameters);
        // Create URL Request
        let request = NSMutableURLRequest(url:myUrl! as URL);
        // Set request HTTP method.
        request.httpMethod = "GET"
        // Add the authorization header and token
        request.addValue("Bearer 4GJSKorDcNh8W1VeVufmMNzJEhm3aw26Fsov2NJ", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
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
            print ("responseString Data: \(responseString)")
            
            
            //Decode JSON in data object. It is being read into an array.
            //It should be possible to make a generic solution.
            //want to move the decoding into BusinessLogic
            if let usableData = data {
                //print ("UsableData: \(usableData)")
                let responseString = NSString(data: usableData, encoding: String.Encoding.utf8.rawValue)
                print ("responseString UsableData: \(responseString)")
                
                let decoder = JSONDecoder()
                do {
                    let dataPoints = try decoder.decode(ppmDatapointsDTO.self, from: usableData)
                    completionHandler(dataPoints)
                } catch {
                    print ("Error: " + error.localizedDescription)
                }
                
            } else {
                print("JSON ERROR")
            }
        }
        //Start task
        task.resume()
    }
    
    
    
    //Getting the last ppm for a room. Frontpage ppmLabel
    func getCurrentppm(room: String, completionHandler: @escaping (Double) -> Void ){
        // Define server URL
        let scriptUrl = "https://api.allthingstalk.io/"
        // Add parameters and endpoint
        let urlWithParameters = scriptUrl + "asset/ZAYH4hpm6vhMGvCKEcHhNqA8/state/"
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
            // print("data = \(data)  \n\n")
            // print("responseString = \(responseString)  \n\n")
            // print("response = \(response)\n\n")
            // print("error = \(error)")
            print ("responseString: \(responseString)")
            //Decode JSON in data object. It is being read into an array.
            //It should be possible to make a generic solution.
            //want to move the decoding into BusinessLogic
            
            if let usableData = data {
                print ("UsableData: \(usableData)")
                var ppm:Double=0.0
                var dataPoints=ppmDatapointDTO(id: "",value: 0.0, at: "")
                let decoder = JSONDecoder()
                do {
                    dataPoints = try decoder.decode(ppmDatapointDTO.self, from: usableData)
                    ppm = dataPoints.state.value
                } catch {
                    print (error.localizedDescription)
                }
                print("ppm: \(ppm)")
                completionHandler(ppm)
            } else {
                print("JSON ERROR")
            }
        }
        //Start task
        task.resume()
    }
    
    func writeComment (comment:CommentDTO){
        
        
        
    }
    
    
    
}


