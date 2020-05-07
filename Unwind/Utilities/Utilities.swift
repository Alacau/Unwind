//
//  Utilities.swift
//  Unwind
//
//  Created by Alan Cao on 5/6/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

class Utilities {
    func makeLandingTitle(text: String, font: String, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: font, size: size)
        label.textAlignment = .center
        
        return label
    }
    
    func makeAttributedButton(firstHalf: String, secondHalf: String) {
        
    }
}
