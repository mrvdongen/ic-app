//
//  Sha256.swift
//  IC-App
//
//  Created by Mike Dongen van on 20/11/2016.
//  Copyright © 2016 Mike Dongen van. All rights reserved.
//

import Foundation

class Sha{
    
    static func sha256(string: String) -> Data? {
        guard let messageData = string.data(using:String.Encoding.utf8) else { return nil }
        var digestData = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes {digestBytes in
            messageData.withUnsafeBytes {messageBytes in
                CC_SHA256(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        return digestData
    }
}
