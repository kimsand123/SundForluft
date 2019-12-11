//
//  ATTDAO.swift
//  SundForluft
//
//  Created by Kim Sandberg on 17/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation

class ATTDAO{
    
    private var businessLogic=BusinessLogic()
    //static let shared = ATTDAO()
    
    private var dat=Data()
    
    public init(){
        
    }
    
    func getDataPointsForGraph(id: String, fromDate:String, toDate:String ,completionHandler: @escaping (ppmDatapointsDTO) -> Void ){
    
        // Define server URL
        let scriptUrl = "https://api.allthingstalk.io/"
        // Add parameters and endpoints
        let urlWithParameters = scriptUrl + "asset/"+id+"/states?from=" + businessLogic.formatDateForSearch(date: fromDate) + "T00:01:00+0100&to=" + businessLogic.formatDateForSearch(date: toDate)+"T23:59:00"
        
        // Create NSURL Object
        let myUrl = NSURL(string: urlWithParameters);
        // Create MutableURLRequest so that i can change the HTTPmethod, add headers, set that data is in JSON
        let request = NSMutableURLRequest(url:myUrl! as URL);
        // Set request HTTP method.
        request.httpMethod = "GET"
        // Add the authorization header and token
        request.addValue("Bearer 4GJSKorDcNh8W1VeVufmMNzJEhm3aw26Fsov2NJ", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // create a task that does the request and JSON conversion, using the singleton shared method
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            //print ("Com-task started")
            // Check for error
            if error != nil
            {
                print("error=\(String(describing: error))")
                return
            }
            
            //Decoding JSON in data object. It is being read into an array.
            //It should be possible to make a generic solution.
            //want to move the decoding into BusinessLogic
            if let usableData = data {
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
    func getCurrentppm(completionHandler: @escaping (Double) -> Void ){
        let apiUrl = "https://api.allthingstalk.io/asset/ZAYH4hpm6vhMGvCKEcHhNqA8/state/"
        let myUrl = NSURL(string: apiUrl)
        let request = NSMutableURLRequest(url:myUrl! as URL)
        request.httpMethod = "GET"
        request.addValue("Bearer 4GJSKorDcNh8W1VeVufmMNzJEhm3aw26Fsov2NJ", forHTTPHeaderField: "Authorization")

        //Make the request task and json to object conversion.
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            //print ("Com-task started")
            // Check for error
            
            if error != nil
            {
                print("error=\(String(describing: error))")
                return
            }
            
            //Decode JSON in data object. It is being read into an array.
            //It should be possible to make a generic solution.
            //want to move the decoding into BusinessLogic
            if let usableData = data {
                //print ("UsableData: \(usableData)")
                var ppm:Double=0.0
                var dataPoints = ppmDatapointDTO()
                let decoder = JSONDecoder()
                do {
                    dataPoints = try decoder.decode(ppmDatapointDTO.self, from: usableData)
                    guard let unwrappedppm = dataPoints.state.value else{return}
                    ppm = unwrappedppm
                } catch {
                    print (error.localizedDescription)
                }
                completionHandler(ppm)
            } else {
                print("JSON ERROR")
            }
        }
        //execute the task
        task.resume()
    }
    
    func getDeviceAssets(completionHandler: @escaping ([AssetDTO]) -> Void ){
        
        let apiUrl = "https://api.allthingstalk.io/device/6nGZdUDfxK8DR3XgqY7G9McY/assets/"
        let myUrl = NSURL(string: apiUrl)
        let request = NSMutableURLRequest(url:myUrl! as URL)
        request.httpMethod = "GET"
        request.addValue("Bearer 4GJSKorDcNh8W1VeVufmMNzJEhm3aw26Fsov2NJ", forHTTPHeaderField: "Authorization")
        
        // create Request task and JSON conversion
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            //print ("Com-task started")
            // Check for error
            if error != nil
            {
                print("error=\(String(describing: error))")
                return
            }
            //Decode JSON in data object. It is being read into an array.
            //It should be possible to make a generic solution.
            //want to move the decoding into BusinessLogic
            
            if let usableData = data {
                let decoder = JSONDecoder()
                do {
                    let assets = try decoder.decode([AssetDTO].self, from: usableData)
                    completionHandler(assets)
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
}




