//
//  DAO.swift
//  SundForluft
//
//  Created by Kim Sandberg on 17/10/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation
//This is defined as a singleton so to access its
//funcitons you write DAO.shared.<function>

class DAO{
    
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
    
    public func getCurrentppm(room: String)-> ppmDTO{
        var currentppm = ppmDTO()
        
        //get the latest ppm reading from this room
        
        return currentppm
    }
    
    func getLocalData(completion: (json: [[String:AnyObject]]?) -> Void) {
        let endPoint = "http://******************"

        let url:NSURL? = NSURL(string: endPoint)
        let session = URLSession.shared

        let request:NSMutableURLRequest = NSMutableURLRequest(url: url! as URL)

        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("", forHTTPHeaderField: "Authorization-Header")


        let task = session.dataTask(with: request as URLRequest) {(data, response, error) -> Void in
            print("Session") //not able to get in here
            guard let data = data, error == nil else {
                //network error
                print("Error with network: \(error?.localizedDescription)")
                completion(nil)
                return
            }

            let httpResponse = response as! HTTPURLResponse//HTTPURLResponse
            let statusCode = httpResponse.statusCode

            if statusCode == 200 {
                do {
                    print("Here buddy")
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: AnyObject]]
                    // return json
                    completion(json)
                }

                catch {
                    print("Error in json")
                    completion(nil)
                }
            }
        }

        task.resume()
    }
    
    
}
