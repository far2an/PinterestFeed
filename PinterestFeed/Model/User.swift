//
//  User.swift
//  PinterestFeed
//
//  Created by Farzan on 8/26/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import Foundation

struct User: Codable {
    
    let id: String
    let username: String
    let name: String
    let profile_image: ProfileImage
    let links: Links
    
}
