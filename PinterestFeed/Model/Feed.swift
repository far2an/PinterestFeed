//
//  Feed.swift
//  PinterestFeed
//
//  Created by Farzan on 8/26/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import Foundation
import FANetworking

struct Feed: Codable {
    
    let id: String
    let created_at: String
    let width: CGFloat
    let height: CGFloat
    let color: String
    let likes: Int?
    let liked_by_user: Bool = false
    let user: User?
    let urls: URLS?
    let categories: [Category]?
    let links: Links?

    
    func getHeight(with width: CGFloat) -> CGFloat {
        let ratio = (self.width > self.height) ? self.height / self.width : self.width / self.height
        return (self.width < self.height) ? width/ratio + 20 : width*ratio + 20
    }
    
    /// Returns a Feeds Array object from a server.
    ///
    /// - Returns: An Array of Feed object

    static func fetch(completionHandler: @escaping ([Feed]?) -> Void) {
        APIClient.shared.request(url: ApiAddress.Feed.fetch) { data in
            guard let data = data else {
                completionHandler(nil)
                return
            }
            
            do {
                let string = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [[String: Any]]
                print(string)
                let feeds = try JSONDecoder().decode([Feed].self, from: data)
                completionHandler(feeds)
            } catch let err {
                debugPrint(err.localizedDescription)
                completionHandler(nil)
            }
        }
    }
}
