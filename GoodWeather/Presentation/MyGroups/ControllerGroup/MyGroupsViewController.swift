//
//  MyGroupsViewController.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 12.08.2021.
//

import UIKit

class MyGroupsViewController: UIViewController {
    @IBOutlet var groupTableView: UITableView!
    
    let groups = ["Dragons", "Fairies", "Beasts"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTableView.delegate = self
        groupTableView.dataSource = self
    }
      }

extension MyGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.identifier) as! GroupTableViewCell
    
        cell.configure(imageName: "Dragon", title: groups[indexPath.row])
        return cell
    }
   
}
