//
//  GroupPicView.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 30.08.2021.
//

import UIKit

class GroupPicView: UIView {
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
            } ()
    
    
    override class var layerClass: AnyClass {
        return CALayer.self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(imageView)
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.4453833299, green: 0.5335578488, blue: 0.5540393947, alpha: 1).cgColor
        
        imageView.layer.masksToBounds = true
        
        self.layer.shadowColor = #colorLiteral(red: 0.4453833299, green: 0.5335578488, blue: 0.5540393947, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 0.2
              
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        let radius = frame.size.width / 2
        self.layer.cornerRadius = radius
        imageView.layer.cornerRadius = radius
    }
    
    func setImage(_ image: UIImage?){
        imageView.image = image
    }
    
}

