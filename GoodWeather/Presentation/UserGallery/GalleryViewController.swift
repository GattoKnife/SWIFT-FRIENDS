//
//  GalleryViewController.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 19.08.2021.
//

import UIKit

final class GalleryViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var gallery: [Gallery] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension GalleryViewController: UICollectionViewDelegate {
    
}


extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryViewCell.identifier, for: indexPath) as! GalleryViewCell
        
        let userGallery = gallery[indexPath.item]
        cell.configure(userGallery)
        cell.likeTapped = { [weak self] isLiked in
            self?.gallery[indexPath.item].isLiked = isLiked
        }
        return cell
    }
}
