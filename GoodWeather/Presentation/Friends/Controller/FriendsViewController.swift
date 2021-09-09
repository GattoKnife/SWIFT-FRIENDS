//
//  FriendsViewController.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 12.08.2021.
//

import UIKit

class FriendsViewController: UIViewController {
    
    
    
    @IBOutlet var tableView: UITableView!
    
    
    let storage: FriendsStorage = FriendsStorage()
    var friends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friends = storage.friends
        tableView.delegate = self
        tableView.dataSource = self
        //UserPicView.setImage(UIImage(named: friend.userPic))
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGallery" {
            
            guard
                let destinationVC = segue.destination as? GalleryViewController,
                let indexSelectCell = tableView.indexPathForSelectedRow?.row
            else {return}
            
            let selectedFriend = friends[indexSelectCell]
            destinationVC.title = selectedFriend.name
            destinationVC.gallery = selectedFriend.gallery
        }
    }
    @IBAction func addUser (_ segue: UIStoryboardSegue) {
        guard
            let sourceController = segue.source as? AllUsersViewController,
            let indexSelectCell = sourceController.tableView.indexPathForSelectedRow
        
        else { return }
        
        let friend = sourceController.sortedUsers[indexSelectCell.section][indexSelectCell.row]
        if !friends.contains(where: {friend.name == $0.name}) {
            friends.append(friend)
        }
        tableView.reloadData()
    }
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier) as! FriendsTableViewCell
        
        cell.configure(friend: friends[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
        
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            
            self.friends.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        action.backgroundColor = #colorLiteral(red: 0.6033485814, green: 0.7556870102, blue: 0.7961941749, alpha: 1)
        action.image = UIImage(systemName: "trash.fill")
        return action
    }
    
}
