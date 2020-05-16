//
//  UserService.swift
//  Unwind
//
//  Created by Alan Cao on 5/15/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchCurrentUser(uid: String, completion: @escaping(User) -> Void) {
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            let user = User.init(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
}
