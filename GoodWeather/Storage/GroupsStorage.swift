//
//  GroupsStorage.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 29.08.2021.
//

import UIKit

class GroupsStorage {
    var groups: [Group]
    let allGroups: [Group]
    
    init() {
        groups = [
            Group(groupTitle: "Royal Families", groupImage: "crown", groupDescription: "Here you will know everything you need about royal Families of V Dominion"),
        
            Group(groupTitle: "GODS", groupImage: "gethra", groupDescription: "Information about Gods")
        ]
       
        
        allGroups = [
            Group(groupTitle: "Royal Families", groupImage: "crown", groupDescription: "Here you will know everything you need about royal Families of V Dominion"),
        
            Group(groupTitle: "GODS", groupImage: "gethra", groupDescription: "Information about Gods"),
            
            Group(groupTitle: "MAGIC BEASTS", groupImage: "dragon2", groupDescription: "Do you like magic beasts? Join us!"),
        
            Group(groupTitle: "WEAPON", groupImage: "SacredBlade", groupDescription: "If you like weapon... We are waiting 4 U.")
        ]
    }
}
