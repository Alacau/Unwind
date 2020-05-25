//
//  ArticlesViewModel.swift
//  Unwind
//
//  Created by Alan Cao on 5/18/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit
import SDWebImage

class ArticlesViewModel {
    
    // MARK: - Properties
    
    var article: Articles
    
    var title: String {
        return article.title
    }
    
    var caption: String {
        return article.caption
    }
    
    var fullnameLabel: String {
        return article.user.fullname
    }
    
    var content: String {
        return article.content
    }
   
    var timestamp: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YYYY"
        return formatter.string(from: article.timestamp)
    }
    
    // MARK: - Lifecycle
    
    init(article: Articles) {
        self.article = article
    }
}
