//
//  FavoritesCell.swift
//  Unwind
//
//  Created by Alan Cao on 5/29/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit
import SDWebImage

class FavoritesCell: UITableViewCell {
    
    // MARK: - Properties
    
    var articles: Articles? {
        didSet { configure() }
    }
    
    private let profileImageView: UIImageView = {
        let imageView = Utilities().simpleImageView(image: UIImage(named: "favorites"), cornerRadius: 44 / 2, borderWidth: 0.3)
        imageView.contentMode = .center
        imageView.setDimensions(width: 44, height: 44)
        return imageView
    }()
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Sarabun", size: 20)
        return label
    }()
    
    private let timestampLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Sarabun", size: 16)
        label.textColor = .gray
        return label
    }()
    
    private let articleImageView: UIImageView = {
        let imageView = Utilities().simpleImageView(image: UIImage(named: "favorites-filled"), cornerRadius: 96 / 4, borderWidth: 0.1)
        imageView.image = UIImage(named: "favorites-filled")
        imageView.contentMode = .scaleAspectFill
        imageView.setDimensions(width: 108, height: 96)
        return imageView
    }()
    
    private let articleTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Sarabun-Bold", size: 20)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        
        let userStack = UIStackView(arrangedSubviews: [profileImageView, fullnameLabel, timestampLabel])
        userStack.axis = .horizontal
        userStack.spacing = 12
        
        let articleStack = UIStackView(arrangedSubviews: [articleImageView, articleTitleLabel])
        articleStack.axis = .horizontal
        articleStack.spacing = 12
        
        let stack = UIStackView(arrangedSubviews: [userStack, articleStack])
        stack.axis = .vertical
        stack.spacing = 12
        
        addSubview(stack)
        stack.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 12, paddingRight: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configure() {
        guard let articles = articles else { return }
        let viewModel = ArticlesViewModel(article: articles)
        fullnameLabel.text = viewModel.fullnameLabel
        timestampLabel.text = viewModel.timestamp
        articleImageView.sd_setImage(with: articles.image)
        articleTitleLabel.text = viewModel.title
    }
}

