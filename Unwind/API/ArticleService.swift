//
//  ArticleService.swift
//  Unwind
//
//  Created by Alan Cao on 5/15/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import Firebase

struct ArticleService {
    static let shared = ArticleService()
    
    func postArticle(title: String, caption: String, content: String, completion: ((Error?) -> Void)?) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let values = [
            "uid": uid,
            "timestamp": Int(NSDate().timeIntervalSince1970),
            "favorites": 0,
            "title": title,
            "caption": caption,
            "content": content
            ] as [String : Any]
        
        REF_ARTICLES.document().setData(values, completion: completion)
    }
}
