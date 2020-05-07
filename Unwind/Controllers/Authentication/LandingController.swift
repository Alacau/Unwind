//
//  LandingController.swift
//  Unwind
//
//  Created by Alan Cao on 5/6/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

class LandingController: UIViewController {
   
    // MARK: - Properties
    
    private let landingBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "landing")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = Utilities().makeLandingTitle(text: "Unwind", font: "Sarabun-ExtraBold", size: 56)
        return label
    }()
    
    private let captionLabel: UILabel = {
        let label = Utilities().makeLandingTitle(text: "Think in peace.", font: "Sarabun-Regular", size: 24)
        return label
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        let title = NSAttributedString(string: "Sign in with Email", attributes: [.font : UIFont(name: "Sarabun-Bold", size: 16)!, .foregroundColor : UIColor.white])
        button.setAttributedTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .unwindRed
        button.layer.cornerRadius = 52 / 2
        return button
    }()
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(landingBackground)
        landingBackground.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: -80, paddingBottom: -80, paddingRight: -95)
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, captionLabel])
        stack.axis = .vertical
        view.addSubview(stack)
        stack.centerX(inView: view, topAnchor: view.topAnchor, paddingTop: view.frame.height / 3)
        
        view.addSubview(signInButton)
        signInButton.anchor(top: stack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20, height: 52)
    }
}
