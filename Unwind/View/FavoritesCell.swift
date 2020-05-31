//
//  FavoritesCell.swift
//  Unwind
//
//  Created by Alan Cao on 5/29/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

class FavoritesCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let timestampLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let articleImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let articleTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemIndigo
        
        let userStack = UIStackView(arrangedSubviews: [profileImageView, fullnameLabel, timestampLabel])
        userStack.axis = .horizontal
        userStack.spacing = 16
        
        let articleStack = UIStackView(arrangedSubviews: [articleImageView, articleTitleLabel])
        articleStack.axis = .horizontal
        articleStack.spacing = 12
        
        addSubview(userStack)
        userStack.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 12, paddingRight: 12)
        
        addSubview(articleStack)
        articleStack.anchor(top: userStack.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 12, paddingBottom: 12, paddingRight: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

