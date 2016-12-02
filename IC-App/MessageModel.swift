//
//  MessageModel.swift
//  IC-App
//
//  Created by Mike Dongen van on 24/11/2016.
//  Copyright © 2016 Mike Dongen van. All rights reserved.
//

import Foundation

struct MessageModel{
    let id:String
    let sender:String
    let message:String
    
    init(Json data:[String:AnyObject]){
        self.id = data["Id"] as! String
        self.sender = data["Sender"] as! String
        self.message = data["Message"] as! String
    }
    
}
