//
//  User.swift
//  Unwind
//
//  Created by Alan Cao on 5/14/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import Firebase

struct User {
    let uid: String
    let email: String
    let fullname: String
    let username: String
    
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == uid
    }
    
    init(uid: String, dictionary: [String: AnyObject]?) {
        self.uid = uid
        
        self.email = dictionary?["email"] as? String ?? ""
        self.fullname = dictionary?["fullname"] as? String ?? ""
        self.username = dictionary?["username"] as? String ?? ""
    }
}
