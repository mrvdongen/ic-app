//
//  Physician.swift
//  IC-App
//
//  Created by Mike Dongen van on 13/11/2016.
//  Copyright © 2016 Mike Dongen van. All rights reserved.
//

import Foundation

class Physician{
    
    var physicianList:[PhysicianModel] = []
    let pin:[Int] = [1,2,3,4]
    
    func checkPin(pin:[Int]) -> Bool{
        if self.pin == pin{
            return true
        }
        
        return false
    }
    
    func retriveInitData(withSuccess success: () -> (),
                         orFailure failure: () -> ()){
        
        let api = APIManger()
        
    }
}
