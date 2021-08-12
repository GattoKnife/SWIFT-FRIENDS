//
//  FriendsViewController.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 12.08.2021.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let friends = ["Bregor Samonetti", "Marus Mirua", "Khali Miu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGallery" {
            let destinationVC = segue.destination
            guard
            let indexSelectCell = tableView.indexPathForSelectedRow?.row
            else {return}
            destinationVC.title = friends[indexSelectCell]
        }
    }
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier) as! FriendsTableViewCell
        
        cell.configure(imageName: "Bregor", title: friends[indexPath.row])
        return cell
    }
   
}
