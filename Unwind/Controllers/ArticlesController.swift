//
//  ArticlesController.swift
//  Unwind
//
//  Created by Alan Cao on 5/17/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

class ArticlesController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleCancel() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        configureNavigationUI()
    }
    
    func configureNavigationUI() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = .unwindRed
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage() // Removes underline view of navigation

        let logoImageView = UIImageView(image: UIImage(named: "nav-logo"))
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.setDimensions(width: 64, height: 64)

        navigationItem.titleView = logoImageView
        
    }
}
