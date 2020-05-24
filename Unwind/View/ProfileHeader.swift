//
//  ProfileHeader.swift
//  Unwind
//
//  Created by Alan Cao on 5/23/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

class ProfileHeader: UIView {
    
    // MARK: - Properties
    
    let userProfileImage: UIImageView = {
        let imageView = Utilities().simpleImageView(image: UIImage(named: "user"), cornerRadius: 56 / 2, borderWidth: 0.3)
        imageView.contentMode = .center
        imageView.setDimensions(width: 56, height: 56)
        return imageView
    }()
    
    let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Sarabun", size: 18)
        label.text = "First Last"
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Sarabun", size: 16)
        label.text = "@username"
        return label
    }()
    
    private lazy var underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let articleLabel: UILabel = {
        let label = UILabel()
        label.text = "Articles"
        label.font = UIFont(name: "Sarabun-Bold", size: 24)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let nameStack = UIStackView(arrangedSubviews: [fullnameLabel, usernameLabel])
        nameStack.axis = .vertical
        
        let stack = UIStackView(arrangedSubviews: [userProfileImage, nameStack])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .center
        
        addSubview(stack)
        stack.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, paddingTop: 20, paddingLeft: 20)
        
        addSubview(underlineView)
        underlineView.anchor(top: stack.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 20, height: 0.5)
        
        addSubview(articleLabel)
        articleLabel.anchor(top: underlineView.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
