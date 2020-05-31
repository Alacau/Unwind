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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

