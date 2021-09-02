//
//  AllGroupsViewController.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 29.08.2021.
//

import UIKit

class AllGroupsViewController: UIViewController, UISearchBarDelegate {
    
      
    @IBOutlet var allGroupsController: UITableView!
    let storageGroups: GroupsStorage = GroupsStorage()
    var groups: [Group] = []
    private let searchController = UISearchController(searchResultsController: nil)
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups = storageGroups.allGroups
        allGroupsController.delegate = self
        allGroupsController.dataSource = self
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    }



extension AllGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllGroupsViewCell.identifier) as! AllGroupsViewCell
        
        cell.configure(group: groups[indexPath.row])
        return cell
    }
    
      
    }
extension AllGroupsViewController: UISearchResultsUpdating {
   
    func updateSearchResults(for searchController: UISearchController) {
        filterGroupsBySearchText(searchController.searchBar.text!)
      
    }
    
    private func filterGroupsBySearchText(_ searchText: String) {
        let filtredGroups: [Group]
       
        if searchText .isEmpty {
            filtredGroups = storageGroups.allGroups
            
        } else {
        
            filtredGroups = groups.filter({ (group: Group) -> Bool in
           
                return group.groupTitle.lowercased().contains(searchText.lowercased())
        })
        }
        groups = filtredGroups
       
        self.allGroupsController.reloadData()
    }
    
}
        
