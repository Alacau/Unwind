//
//  EditProfileController.swift
//  Unwind
//
//  Created by Alan Cao on 6/12/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SettingsCell"

class EditProfileController: UITableViewController {
    
    // MARK: - Properties
    
    private let imagePicker = UIImagePickerController()
    
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
        tableView.separatorStyle = .none
        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = EditProfileHeader()
        headerView.delegate = self
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return view.frame.height / 4
    }
}

extension EditProfileController: EditProfileDelegate {
    func handleEditProfile() {
        imagePicker.delegate = self
    }
}

extension EditProfileController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
}
