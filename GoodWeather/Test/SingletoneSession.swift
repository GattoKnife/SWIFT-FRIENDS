//
//  SingletoneSession.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 23.09.2021.
//

import UIKit

class SingletoneSession {
    static let shared = SingletoneSession()
    var token: String = ""
    var userID: Int = 0
    private init(){}
}


