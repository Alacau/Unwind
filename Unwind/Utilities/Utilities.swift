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
        let title = NSAttributedString(string: title, attributes: [.font : UIFont(name: "Sarabun-Bold", size: 20)!, .foregroundColor : UIColor.white])
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
    
    func inputContainerView(withImage image: UIImage?, textField: UITextField) -> UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true

        let imageView = UIImageView()
        imageView.image = image
        
        view.addSubview(imageView)
        imageView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
        imageView.setDimensions(width: 24, height: 24)
        
        view.addSubview(textField)
        textField.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .black
        view.addSubview(dividerView)
        dividerView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingRight: 8, height: 0.75)
        
        return view
    }
    
    func textField(withPlaceholder placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.clearButtonMode = .whileEditing
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor : UIColor.placeholderText])
        
        return textField
    }
}
