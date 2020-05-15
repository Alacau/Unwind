//
//  Articles.swift
//  Unwind
//
//  Created by Alan Cao on 5/14/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import Foundation

struct Articles {
    let uid: String
    let title: String
    let caption: String
    let content: String
    
    init(uid: String, dictionary: [String: AnyObject]?) {
        self.uid = uid
        
        self.title = dictionary?["title"] as? String ?? ""
        self.caption = dictionary?["caption"] as? String ?? ""
        self.content = dictionary?["content"] as? String ?? ""
    }
}
