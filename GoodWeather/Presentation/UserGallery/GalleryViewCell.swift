//
//  GalleryViewCell.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 19.08.2021.
//

import UIKit

final class GalleryViewCell: UICollectionViewCell {
    
    
    static let identifier: String = "GalleryViewCell"
    
    var likeTapped: ((Bool) -> Void)?
    
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var discLabel: UILabel!
    @IBOutlet private var isLiked: isLikedView!
    
          
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTarget()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
     }
    
    func configure (_ gallery: Gallery) {
        
        dateLabel.text = gallery.date
        discLabel.text = gallery.aboutImage
        imageView.image = UIImage(named: gallery.galleryImage)
        //isLiked.isLiked = gallery.isLiked
        isLiked.configure(isLiked: gallery.isLiked , numbersOfLike: gallery.numbersOfLike)
        
    }
    
    private func setupTarget() {
        isLiked.addTarget(self, action: #selector(controlTapped), for: .valueChanged)
    }
    
    @objc private func controlTapped(){
        likeTapped?(isLiked.isLiked)
    }
}
