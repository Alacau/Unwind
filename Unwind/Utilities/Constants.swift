//
//  Constants.swift
//  Unwind
//
//  Created by Alan Cao on 5/13/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import Firebase

let FS_REF = Firestore.firestore()

let REF_USERS = FS_REF.collection("users")
let REF_ARTICLES = FS_REF.collection("articles")
let REF_USER_ARTICLES = FS_REF.collection("user-articles")
