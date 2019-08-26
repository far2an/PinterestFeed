//
//  PhotoCell.swift
//  PinterestApplication
//
//  Created by Gary Tokman on 12/5/17.
//  Copyright © 2017 Gary Tokman. All rights reserved.
//

import UIKit

class PhotoCell: BaseCell<Feed> {
    
    override var item: Feed? {
        didSet {
            if let color = item?.color {
                imageView.backgroundColor = UIColor(hexString: color)
            }
            if let url = item?.urls?.small {
                imageView.getImage(url: url)
            }
        }
    }
    
    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    var menuButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "menu"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    override func setupViews() {
        addSubview(imageView)
        addSubview(menuButton)
        
        addconstraintsWithFormat("V:|[v0]-8-[v1]|", views: imageView, menuButton)
        addconstraintsWithFormat("H:|[v0]|", views: imageView)
        addconstraintsWithFormat("H:[v0]-8-|", views: menuButton)

    }
    
    
}
