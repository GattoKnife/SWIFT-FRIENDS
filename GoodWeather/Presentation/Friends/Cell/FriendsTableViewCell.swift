//
//  FriendsTableViewCell.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 12.08.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    static let identifier = "FriendsTableViewCell"
    
    
    @IBOutlet private var iconFriend: UserPicView!
    @IBOutlet private var nameOfFriend: UILabel!
    
    
    func configure (friend: Friend) {
        //iconFriend.imageView.image = UIImage(named: friend.userPic)
        iconFriend.setImage(UIImage(named: friend.userPic))
        nameOfFriend.text = friend.name
        self.configureTap()
   }
    
   
     func configureTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedIconFriend))
        iconFriend.addGestureRecognizer(tap)
        
        }

    @objc func tappedIconFriend() {
        UIView.animateKeyframes(
            withDuration: 0.3,
            delay: 0,
            options: [],
            animations: {
                UIView.addKeyframe(withRelativeStartTime: 0,
                                   relativeDuration: 0.8,
                                   animations: {
                                    self.iconFriend.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                                   })
                UIView.addKeyframe(withRelativeStartTime: 0.2,
                                   relativeDuration: 0.8,
                                   animations: {
                                    self.iconFriend.transform = .identity
                                   })
            }

        )
    }
    
}
