//
//  GroupTableViewCell.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 12.08.2021.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    static let identifier = "GroupTableViewCell"
    
    @IBOutlet private var groupImageCell: UIImageView!
    @IBOutlet private var groupNameCell: UILabel!
   
    func configure (imageName: String?, title: String?) {
        groupImageCell.image = UIImage(named: "Dragon")
        groupNameCell.text = title
}
}
