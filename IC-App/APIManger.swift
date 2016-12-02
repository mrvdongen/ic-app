//
//  APIManger.swift
//  IC-App
//
//  Created by Mike Dongen van on 20/11/2016.
//  Copyright © 2016 Mike Dongen van. All rights reserved.
//

import Foundation

class APIManger : APIMangerBase{
    
    func getEmployees(withSuccess success: @escaping ([[String:AnyObject]]) -> (),
                      orFailure failure: @escaping (String) -> ()){

//        self.get(fromPath: "Employee",
//                 withSuccess: success,
//                 orFailure: failure)
    }
    
    func getMessage(withSuccess success: @escaping ([[String:AnyObject]]) -> (),
                    orFailure failure: @escaping (String) -> ()){
        
        self.get(fromPath: "Messages",
                 withHeaders: [:],
                 andParameters: [:],
                 withSuccess: {(json: Any) in
                    let data = json as! [[String:AnyObject]]
                    success(data)
        },
                 orFailure: {(message:String) in
                    failure(message)
        })
    }
    
    func sendMessage(withSuccess success: @escaping (Any) -> (),
                     orFailure failure: @escaping (String) -> ()){
        
        self.post(formPath: "Message/Send",
                  withHeaders: [:],
                  andParameters: [:],
                  withSuccess: { (data: Any) in
                    success(data)
        }) { (message:String) in
            failure(message)
        }
    }
    // more api calls
}
