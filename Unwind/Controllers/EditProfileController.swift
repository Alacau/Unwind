//
//  EditProfileController.swift
//  Unwind
//
//  Created by Alan Cao on 6/12/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

class EditProfileController: UITableViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureUI()
        configureNavigation()
    }
    
    // MARK: - API
    
    // MARK: - Selectors
    
    // MARK: - Helpers
    
    func configureUI() {
        tableView.tableFooterView = UIView()
    }
    
    func configureNavigation() {
        title = "Edit Profile"
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension EditProfileController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
