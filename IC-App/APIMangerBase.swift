//
//  APIMangerBase.swift
//  IC-App
//
//  Created by Mike Dongen van on 20/11/2016.
//  Copyright © 2016 Mike Dongen van. All rights reserved.
//

import Foundation

class APIMangerBase{
    
    let baseURL = URL(string: "https://icappapi.bouwe.it/")
    var task:URLSessionDataTask? = nil
    
    func perform(method: Method,
                 fromPath path: String,
                 withHeaders headers: [String:String] = [:],
                 andParameters parameters: [String:String] = [:],
                 withSuccess success: @escaping (Any) -> (),
                 orFailure failure: @escaping (String) -> ()) {
        
        if let url = URL(string: path, relativeTo: baseURL){
            let session =  URLSession.shared
            let request = NSMutableURLRequest(url: url)
            request.httpMethod = String(describing: method)
            
            for (key,value) in headers{
                request.addValue(value , forHTTPHeaderField: key)
            }
            
            do{
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            }
            catch{
                print("Unable to place data in header")
            }
            
            let task = session.dataTask(with: request as URLRequest){ (data, response, error) in
                guard let _ :NSData = data as NSData?, let _: URLResponse = response, error == nil else{
                    failure("ERROR retriving data")
                    return
                }
                
                let statusCode = response as! HTTPURLResponse
                if statusCode.statusCode != 200 {
                    failure("Error, statuscode: \(statusCode.statusCode)")
                    return
                }
                
                if let retrived = data{
                    do{
                        let json = try JSONSerialization.jsonObject(with: retrived, options: JSONSerialization.ReadingOptions())
                        success(json)
                    }
                    catch{
                        failure("Failed to parse json")
                    }
                }
            }
            task.resume()
        }
    }
    
    func get(fromPath path: String,
             withHeaders headers:[String:String] = [:],
             andParameters parameters:[String:String] = [:],
             withSuccess success: @escaping (Any) -> (),
             orFailure failure: @escaping(String)-> ()) {
        
        self.perform(method: Method.GET,
                     fromPath: path,
                     withHeaders: headers,
                     andParameters: parameters,
                     withSuccess: success,
                     orFailure: failure)
    }
    
    func post(formPath path: String,
              withHeaders headers: [String:String] = [:],
              andParameters parameters: [String:String] = [:],
              withSuccess success: @escaping (Any) -> (),
              orFailure failure: @escaping (String) -> ()) {
        
        self.perform(method: Method.POST,
                     fromPath: path,
                     withHeaders: headers,
                     andParameters: parameters,
                     withSuccess: success,
                     orFailure: failure)
    }
    
    func put(fromPath path: String,
             withHeaders headers: [String:String] = [:],
             andParameters parameters: [String:String] = [:],
             withSuccess success: @escaping (Any) -> (),
             orFailure failure: @escaping (String) -> ()) {
        
        self.perform(method: Method.PUT,
                     fromPath: path,
                     withHeaders: headers,
                     andParameters: parameters,
                     withSuccess: success,
                     orFailure: failure)
    }
    
    func delete(fromPath path: String,
                withHeaders headers: [String:String] = [:],
                andParameters parameters: [String:String] = [:],
                withSuccess success: @escaping (Any) -> (),
                orFailure failure: @escaping (String) -> ()) {
        
        self.perform(method: Method.DELETE,
                     fromPath: path,
                     withHeaders: headers,
                     andParameters: parameters,
                     withSuccess: success,
                     orFailure: failure)
    }
}
