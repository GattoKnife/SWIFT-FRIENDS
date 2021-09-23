//
//  AllUsersViewController.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 18.08.2021.
//

import UIKit

final class AllUsersViewController: UIViewController, UISearchBarDelegate {
    
    
    @IBOutlet var tableView: UITableView!
     
    private let storage: FriendsStorage = FriendsStorage()
    var friends: [Friend] = []
    var firstLetters: [String] = []
    var sortedUsers = [[Friend]]()
    var searching: Bool = false
    private let searchController = UISearchController(searchResultsController: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        friends = storage.allFriends
        firstLetters = firstLetters(friends)
        sortedUsers = sortedUsers(friends, firstLetter: firstLetters)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(allUsersHeaderViewCell.self, forHeaderFooterViewReuseIdentifier: allUsersHeaderViewCell.identifier)
        
        //MARK: setup SearchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by username"
        navigationItem.searchController = searchController
        definesPresentationContext = true
   
    }
  
    private func firstLetters (_ friends: [Friend]) -> [String] {
        let allFirstLetters = friends.map { $0.name}
        let firstLetters = Array(Set(allFirstLetters.map {String($0.prefix(1)) })).sorted()
        return firstLetters
    }
    
    private func sortedUsers(_ friends: [Friend], firstLetter:[String]) -> [[Friend]] {
        var sortedUsers: [[Friend]] = []
        firstLetter.forEach { letter in
            let usersFiltredByLetter = friends.filter { String($0.name.prefix(1)) == letter}
            sortedUsers.append(usersFiltredByLetter)
            
        }
        return sortedUsers
    }
    
}
extension AllUsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
      
        return sortedUsers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return sortedUsers[section].count
     
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: allUsersViewCell.identifier) as! allUsersViewCell
        let friends = sortedUsers[indexPath.section][indexPath.row]
        
        cell.configure(friend: friends)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard !searching else {
            return nil
        }
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: allUsersHeaderViewCell.identifier) as! allUsersHeaderViewCell
        
        header.configure(String(firstLetters[section]))
        return header
    }
   
    //MARK: fight with firstLetter Header while search
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        searching ? 0 : UITableView.automaticDimension
    }
    
        }

extension AllUsersViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterUsersBySearchText(searchController.searchBar.text!)
        
    }
    
    //MARK: searching
    private func filterUsersBySearchText(_ searchText: String) {
        let filtredBySearch: [Friend]
        
        if searchText .isEmpty {
            filtredBySearch = friends
            searching = false
            
        } else {
            searching = true
            filtredBySearch = friends.filter({ (user:Friend) -> Bool in
                
                return user.name.lowercased().contains(searchText.lowercased())
            })
        }
        sortedUsers = sortedUsers(filtredBySearch, firstLetter: firstLetters)
        tableView.reloadData()
    }
    
    
}
        
    


