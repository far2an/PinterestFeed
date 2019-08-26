//
//  FeedViewController+PinterestLayoutDelegate.swift
//  PinterestFeed
//
//  Created by Farzan on 8/26/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import UIKit

extension FeedViewController: PinterestLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let insets = collectionView.contentInset
        let width =  collectionView.bounds.width - (insets.left + insets.right)
        return feeds?[indexPath.item].getHeight(with: width/2) ?? 0
    }
    
}
