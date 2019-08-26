//
//  APIClient.swift
//  PinterestFeed
//
//  Created by Farzan on 8/26/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import Foundation
import FANetworking

class APIClient: NSObject {
    
    let networking: Networking
    
    class var shared: APIClient {
        struct Singleton { static let instance = APIClient() }
        return Singleton.instance
    }
    
    override init() {
        networking = Networking(baseURL: "http://pastebin.com")
        super.init()
    }
    
    /// GET request to the specified path.
    ///
    /// - Parameters:
    ///   - url: The path for the GET request.
    ///   - completion: The result of the operation, it's an enum with two cases: success and failure.
    /// - Returns: The request identifier.
    func request(url: String, completionHandler: @escaping (Data?) -> Void) {
        networking.get(url) { result in
            switch result {
            case .success(let response):
                completionHandler(response.data)
            case .failure(let err):
                debugPrint(err.error.localizedDescription)
                completionHandler(nil)
            }
        }
    }
    
    
    /// Downloads an image using the specified path.
    ///
    /// - Parameters:
    ///   - url: The path where the image is located.
    ///   - completion: The result of the operation, it's an enum with two cases: success and failure.
    /// - Returns: The request identifier.
    func dowmloadImage(url: String, completionHandler: @escaping (UIImage?) -> Void) {
        let networking = Networking(baseURL: url)
        
        networking.downloadImage("", cachingLevel: .memory) { result in
            switch result {
            case .success(let image):
                completionHandler(image.image)
            case .failure(let err):
                debugPrint(err.error.localizedDescription)
                completionHandler(nil)
            }
        }
    }
    
}



