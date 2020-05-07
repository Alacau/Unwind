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
    
    func authButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        let title = NSAttributedString(string: "Sign in with Email", attributes: [.font : UIFont(name: "Sarabun-Bold", size: 16)!, .foregroundColor : UIColor.white])
        button.setAttributedTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .unwindRed
        button.layer.cornerRadius = 52 / 2
        
        return button
    }
    
    func attributedButton(firstPart: String, secondPart: String) -> UIButton {
        let button = UIButton(type: .system)
        let title = NSMutableAttributedString(string: "Don't have an account? ", attributes: [.font : UIFont(name: "Sarabun-Bold", size: 20)!, .foregroundColor : UIColor.black])
        title.append(NSAttributedString(string: "Sign up!", attributes: [.font : UIFont(name: "Sarabun-Bold", size: 20)!, .foregroundColor : UIColor.unwindRed]))
        button.setAttributedTitle(title, for: .normal)

        return button
    }
}
