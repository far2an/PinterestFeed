//
//  Category.swift
//  PinterestFeed
//
//  Created by Farzan on 8/26/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import Foundation

struct Category: Codable {
    
    let id: Int
    let title: String
    let photo_count: Int
    let links: Links
    
}
