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
        REF_USERS.document(uid).getDocument { (snapshot, error) in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            guard let dictionary = snapshot?.data() as [String: AnyObject]? else { return }
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
}
