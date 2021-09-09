//
//  allUsersViewCell.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 19.08.2021.
//

import UIKit

class allUsersViewCell: UITableViewCell {

    static let identifier = "allUsersViewCell"
    
    @IBOutlet var iconFriend: UILabel!
    @IBOutlet var imageFriend: UserPicView!
    
    
    func configure (friend: Friend) {
        //imageFriend.imageView.image = UIImage(named: friend.userPic)
        imageFriend.setImage(UIImage(named: friend.userPic))
        iconFriend.text = friend.name
    }
}
