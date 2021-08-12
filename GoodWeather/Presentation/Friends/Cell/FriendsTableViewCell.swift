//
//  FriendsTableViewCell.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 12.08.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    static let identifier = "FriendsTableViewCell"
    
    @IBOutlet private var iconFriend: UIImageView!
    @IBOutlet private var nameOfFriend: UILabel!
    
 func configure (imageName: String?, title: String?) {
        iconFriend.image = UIImage(named: "Bregor")
        nameOfFriend.text = title
  }
}
