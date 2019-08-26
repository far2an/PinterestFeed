//
//  BaseCell.swift
//  PinterestFeed
//
//  Created by Farzan on 8/26/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import UIKit

class BaseCell<T>: UICollectionViewCell {
    
    var item: T?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {}
    
}
