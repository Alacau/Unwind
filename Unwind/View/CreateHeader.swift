//
//  CreateHeader.swift
//  Unwind
//
//  Created by Alan Cao on 5/14/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

protocol CreateHeaderDelegate: class {
    func handleImageViewTapped()
}

class CreateHeader: UIView {
    
    // MARK: - Properties
    
    weak var delegate: CreateHeaderDelegate?
    
    let createImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "landing")
        imageView.setDimensions(width: 108, height: 96)
        imageView.layer.cornerRadius = 96 / 4
        imageView.layer.borderWidth = 0.2
        imageView.layer.borderColor = UIColor.black.cgColor
        return imageView
    }()
    
    private let titleTextView = CaptionTextView()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
        
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let createStack = UIStackView(arrangedSubviews: [createImageView, titleTextView])
        createStack.axis = .horizontal
        createStack.spacing = 12
        createStack.alignment = .leading
        
        addSubview(createStack)
        createStack.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        addSubview(separatorView)
        separatorView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
