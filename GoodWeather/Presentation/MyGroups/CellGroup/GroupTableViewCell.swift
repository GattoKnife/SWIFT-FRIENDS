//
//  GroupTableViewCell.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 12.08.2021.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    static let identifier = "GroupTableViewCell"
    
       
    @IBOutlet var groupImageCell: GroupPicView!
    @IBOutlet private var groupNameCell: UILabel!
    @IBOutlet var groupDescriptionCell: UILabel!
   
    func configure (group: Group) {
        //imageFriend.imageView.image = UIImage(named: friend.userPic)
        groupImageCell.setImage(UIImage(named: group.groupImage))
        groupNameCell.text = group.groupTitle
        groupDescriptionCell.text = group.groupDescription
        //groupImageCell.image = UIImage(named: group.groupImage)
}
}
