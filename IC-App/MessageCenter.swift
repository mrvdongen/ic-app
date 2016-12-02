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
    
    func sendMessage(message:MessageModel,
                     withSuccess success: @escaping () -> (),
                     orFailure failure: @escaping (String) -> ()){
        api.sendMessage(withSuccess: { (data: Any) in
            //Do somthing
            success()
        }, orFailure: { (message:String) in
            failure(message)
        })
        success()
        listOfMessages.append(message)
    }
    
    func countMessageList() -> Int{
        return listOfMessages.count
    }
    
    
    func dummyData(){
        
    }
    
    func rawSenderData(from sender:String,
                       withMessage message:String,
                       withSuccess success: @escaping () -> (),
                       orFailure failure: @escaping (String) -> ()){
        let uuid = UUID().uuidString
        
        let message:[String:AnyObject] = ["Id" : uuid as AnyObject, "Message" : message as AnyObject, "Sender" : sender as AnyObject]
        let model = MessageModel.init(Json: message)
        
        sendMessage(message: model, withSuccess: {
            // yey do iets maar nu nog niet want de api werkt niet
        }, orFailure: {(message: String) in
            //
        })
    }
}
