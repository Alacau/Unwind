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
        
        let articleID = REF_ARTICLES.document()
        articleID.setData(values) { (error) in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            REF_USER_ARTICLES.document(uid).updateData([articleID.documentID: 1], completion: completion)
        }
    }
    
    func fetchArticles(completion: @escaping([Articles]) -> Void) {
        var articles = [Articles]()
        REF_ARTICLES.getDocuments { (snapshot, error) in
            if let error = error {
                print("DEGBUG: \(error.localizedDescription)")
                return
            }
            for document in snapshot!.documents {
                guard let dictionary = document.data() as [String: AnyObject]? else { return }
                let uid = document.documentID
                let article = Articles(uid: uid, dictionary: dictionary)
                articles.append(article)
            }
            completion(articles)
        }
    }
}
