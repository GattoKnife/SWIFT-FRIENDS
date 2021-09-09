//
//  AllGroupsViewCell.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 29.08.2021.
//

import UIKit

class AllGroupsViewCell: UITableViewCell {

    @IBOutlet var allGroupImage: GroupPicView!
    
    @IBOutlet var allGroupName: UILabel!
    @IBOutlet var allGroupDescription: UILabel!
    
    static let identifier = "AllGroupsViewCell"
    
    
    func configure (group: Group) {
        //imageFriend.imageView.image = UIImage(named: friend.userPic)
        allGroupImage.setImage(UIImage(named: group.groupImage))
        allGroupName.text = group.groupTitle
        allGroupDescription.text = group.groupDescription
        //allGroupImage.image = UIImage(named: group.groupImage)
}
}
