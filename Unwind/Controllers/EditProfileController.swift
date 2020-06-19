//
//  EditProfileController.swift
//  Unwind
//
//  Created by Alan Cao on 6/12/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

class EditProfileController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureNavigation()
    }
    
    func configureNavigation() {
        title = "Edit Profile"
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
