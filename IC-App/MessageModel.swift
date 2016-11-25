//
//  MessageModel.swift
//  IC-App
//
//  Created by Mike Dongen van on 24/11/2016.
//  Copyright © 2016 Mike Dongen van. All rights reserved.
//

import Foundation

struct MessageModel{
    let id:Int
    let sender:String
    let message:String
    
    init(Json data:[String:AnyObject]){
        self.id = data["Id"] as! Int
        self.sender = data["Sender"] as! String
        self.message = data["Message"] as! String
    }
    
}
