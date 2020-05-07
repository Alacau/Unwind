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
        let label = UILabel()
        label.text = "Unwind"
        label.font = UIFont(name: "Sarabun-Bold", size: 100)
        return label
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
        
        view.addSubview(titleLabel)
        titleLabel.centerX(inView: view, topAnchor: view.topAnchor, paddingTop: view.frame.height / 3)
    }
}
