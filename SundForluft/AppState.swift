//
//  AppState.swift
//  SundForluft
//
//  Created by Kim Sandberg on 27/09/2019.
//  Copyright © 2019 Kim Sandberg. All rights reserved.
//

import Foundation
class AppState {
    
    static var loggedState = false
    
    static let shared = AppState()
    private init(){
    }
    
    static func getLoggedState()-> Bool{
        return loggedState
    }
    
    static func setLoggedState(loggedstate: Bool){
        self.loggedState = loggedstate
    }
    
   
    
    
    
    
}
