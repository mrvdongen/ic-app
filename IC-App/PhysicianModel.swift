//
//  Employee.swift
//  IC-App
//
//  Created by Mike Dongen van on 20/11/2016.
//  Copyright © 2016 Mike Dongen van. All rights reserved.
//

import Foundation

class PhysicianModel {
    let username:String
    let password:String
    let firstName:String
    let lastName:String
    let pin:String
    
    init(Json data: [String:AnyObject]){
        self.username = data["UserName"] as! String
        self.password = data["Password"] as! String
        self.firstName = data["FirstName"] as! String
        self.lastName = data["LastName"] as! String
        self.pin = data["Pin"] as! String
    }
}
