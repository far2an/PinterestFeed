//
//  UIImageView+Extension.swift
//  PinterestFeed
//
//  Created by Farzan on 8/26/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func getImage(url: String) {
        APIClient.shared.dowmloadImage(url: url) { image in
            if let image = image {
                self.image = image
            }
        }
    }
    
}
