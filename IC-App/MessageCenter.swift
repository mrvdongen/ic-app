//
//  MessageCenter.swift
//  IC-App
//
//  Created by Mike Dongen van on 24/11/2016.
//  Copyright © 2016 Mike Dongen van. All rights reserved.
//

import Foundation

class MessageCenter{
    var listOfMessages:[MessageModel] = []
    let api:APIManger = APIManger()
    
    func getMessages(){
        api.getMessage(withSuccess: { (messages:[[String:AnyObject]]) in
            for message in messages {
                self.listOfMessages.append(MessageModel.init(Json: message))
            }
        },
                       orFailure: {(message:String) in
                        print(message)
        })
    }
    
    func sendMessage(message:MessageModel){
        
    }
    
    
    
    
    func dummyData(){
        
    }
}
