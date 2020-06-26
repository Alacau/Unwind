//
//  EditProfileHeader.swift
//  Unwind
//
//  Created by Alan Cao on 6/26/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

class EditProfileHeader: UIView {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.setDimensions(width: 96, height: 96)
        imageView.layer.cornerRadius = 96 / 2
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.image = UIImage(named: "landing")
        return imageView
    }()
    
    let editProfileImageButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedString = NSAttributedString(string: "Edit Photo", attributes: [.font: UIFont(name: "Sarabun-Bold", size: 16)!])
        button.setAttributedTitle(attributedString, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        backgroundColor = .white
        
        let stack = UIStackView(arrangedSubviews: [profileImageView, editProfileImageButton])
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 8
        
        addSubview(stack)
        stack.center(inView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
