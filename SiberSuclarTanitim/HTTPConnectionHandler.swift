//
//  HTTPConnectionHandler.swift
//  SiberSuclarTanitim
//
//  Created by 2016 on 4.12.2017.
//  Copyright © 2017 Kode. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class HTTPConnectionHandler {
    
    //Created a static instance since it should be accessed from everywhere without creating HTTPconnectionHandler instance.
    static let sharedHandler = HTTPConnectionHandler ()

    private let manager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 8
        configuration.timeoutIntervalForResource = 8
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    //Opens a http connection to get data from service
    func getDataFromService(httpMethod: HTTPMethod, url: String, parameters: Parameters?, completion: @escaping (NSDictionary?) -> Void) {
        
        manager.request(url, method: httpMethod, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                print(response)
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
                        print("example success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                //to get JSON return value
                if let result = response.result.value {
                    completion(result as? NSDictionary)
                }
                
                if let result = response.result.error{
                    completion(nil)
                }
        }
        
    }
    
    func getDataFromServiceAsArray(url: String, parameters: Parameters?, completion: @escaping (NSArray) -> Void) {
        
        manager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseJSON { response in
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
                        print("example success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                //to get JSON return value
                if let result = response.result.value {
                    completion(result as! NSArray)
                }
        }
        
    }

    //Opens a http connection to get Image data from service
    func getImageFromService(imageUrl: String, completion: @escaping (UIImage?) -> Void){
        
        manager.request(imageUrl).responseImage { response in
            if let image = response.result.value {
                print("image downloaded: \(image)")
                completion(image)
            }
            else {
                completion(nil)
            }
        }
        
    }
    
}
