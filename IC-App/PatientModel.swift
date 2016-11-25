//
//  PatientModel.swift
//  IC-App
//
//  Created by Mike Dongen van on 20/11/2016.
//  Copyright © 2016 Mike Dongen van. All rights reserved.
//

import Foundation

class PatientModel{
    let id:Int
    let firstName:String
    let lastName:String
    
    init(Json data: [String:AnyObject]){
        self.id = data["Id"] as! Int
        self.firstName = data["FirstName"] as! String
        self.lastName = data["LastName"] as! String
    }
}
