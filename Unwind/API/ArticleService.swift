//
//  ArticleService.swift
//  Unwind
//
//  Created by Alan Cao on 5/15/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import Firebase
import FirebaseDatabase

struct ArticleService {
    static let shared = ArticleService()
        
    func postArticle(title: String, caption: String, content: String, image: UIImage, completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
        let fileName = NSUUID().uuidString
        let storageReference = STORAGE_ARTICLE_IMAGES.child(fileName)
        
        storageReference.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            storageReference.downloadURL { (url, error) in
                if let error = error {
                    print("DEBUG: \(error.localizedDescription)")
                    return
                }
                guard let url = url?.absoluteString else { return }
                let values = [
                    "uid": uid,
                    "timestamp": Int(NSDate().timeIntervalSince1970),
                    "favorites": 0,
                    "title": title,
                    "caption": caption,
                    "content": content,
                    "imageURL": url
                    ] as [String : Any]
                
                REF_ARTICLES.childByAutoId().updateChildValues(values) { (error, reference) in
                    guard let articleID = reference.key else { return }
                    REF_USER_ARTICLES.child(uid).updateChildValues([articleID: 1], withCompletionBlock: completion)
                }
            }
        }
    }
    
    func fetchArticles(completion: @escaping([Articles]) -> Void) {
        var articles = [Articles]()
        REF_ARTICLES.observe(.childAdded) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            guard let uid = dictionary["uid"] as? String else { return }
            
            UserService.shared.fetchCurrentUser(uid: uid) { (user) in
                let article = Articles(user: user, uid: uid, dictionary: dictionary)
                articles.append(article)
                completion(articles)
            }
        }
    }
}
