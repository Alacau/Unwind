//
//  AuthService.swift
//  Unwind
//
//  Created by Alan Cao on 5/11/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
}

struct AuthService {
    static let shared = AuthService()
    
    func signInUser(email: String, password: String, completion: AuthDataResultCallback?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func signUpUser(withCredentials credentials: AuthCredentials, completion: ((Error?) -> Void)?) {
        let email = credentials.email
        let password = credentials.password
        let fullname = credentials.fullname
        let username = credentials.username
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            
            let data = ["email": email, "username": username, "fullname": fullname]
            Firestore.firestore().collection("users").addDocument(data: data, completion: completion)
        }
    }
}
