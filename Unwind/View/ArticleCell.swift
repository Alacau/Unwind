//
//  ArticleCell.swift
//  Unwind
//
//  Created by Alan Cao on 5/14/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    // MARK: - Properties
    
    private var articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.setDimensions(width: 108, height: 96)
        imageView.layer.cornerRadius = 96 / 4
        imageView.layer.borderWidth = 0.1
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.image = UIImage(named: "landing")
        return imageView
    }()
    
    private let articleTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont(name: "Sarabun-Bold", size: 20)
        label.text = "12 reasons why Ashley’s a clown and why she’s not as basic as she thinks she is"
        return label
    }()
    
    // MARK: - Lifecycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        
        let articleStack = UIStackView(arrangedSubviews: [articleImageView, articleTitle])
        articleStack.axis = .horizontal
        articleStack.spacing = 12
        
        addSubview(articleStack)
        articleStack.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 12, paddingRight: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
