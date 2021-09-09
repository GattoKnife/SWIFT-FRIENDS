//
//  MyGroupsViewController.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 12.08.2021.
//

import UIKit

class MyGroupsViewController: UIViewController {
    @IBOutlet var groupTableView: UITableView!
    
    let storageGroups: GroupsStorage = GroupsStorage()
    var groups: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups = storageGroups.groups
        groupTableView.delegate = self
        groupTableView.dataSource = self
    }
    
    @IBAction func addGroup(_ segue: UIStoryboardSegue) {
       guard
        let sourceController = segue.source as? AllGroupsViewController,
        let indexSelectCell = sourceController.allGroupsController.indexPathForSelectedRow
        
       
        else { return }
        let group = sourceController.groups[indexSelectCell.row]
        if !groups.contains(where: { group.groupTitle == $0.groupTitle }) {
            groups.append(group)
        }
        groupTableView.reloadData()
    }
  }






extension MyGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.identifier) as! GroupTableViewCell
        
        cell.configure(group: groups[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
        
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            
            self.groups.remove(at: indexPath.row)
            self.groupTableView.deleteRows(at: [indexPath], with: .fade)
        }
        action.backgroundColor = #colorLiteral(red: 0.6033485814, green: 0.7556870102, blue: 0.7961941749, alpha: 1)
        action.image = UIImage(systemName: "trash.fill")
        return action
    }
}


