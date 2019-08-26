//
//  ViewController.swift
//  PinterestFeed
//
//  Created by Farzan on 8/26/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    let photoCell = "PhotoCell"
    
    var feeds: [Feed]?

    let refreshControl: UIRefreshControl = {
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(reload), for: .valueChanged)
        return rc
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = PinterestLayout()
        layout.delegate = self
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        cv.refreshControl = refreshControl
        cv.backgroundColor = .white
        cv.register(PhotoCell.self, forCellWithReuseIdentifier: photoCell)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetch()
    }

    private func setupViews() {
        view.addSubview(collectionView)
        view.addconstraintsWithFormat("H:|[v0]|", views: collectionView)
        view.addconstraintsWithFormat("V:|[v0]|", views: collectionView)
    }
    
    // Fetch feeds from server side
    private func fetch() {
        Feed.fetch { feeds in
            self.feeds = feeds
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                self.collectionView.reloadData()
            }
        }
    }

    @objc private func reload() {
        self.feeds = nil
        refreshControl.beginRefreshing()
        fetch()
    }

}




