//
//  CreateController.swift
//  Unwind
//
//  Created by Alan Cao on 5/14/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

private let createIdentifier = "CreateCell"

class CreateController: UITableViewController {
   
    // MARK: - Properties
    
    private let createHeader = CreateHeader()
    private let tapGesture = UITapGestureRecognizer()
    private let imagePicker = UIImagePickerController()
    
    private lazy var postButton: UIButton = {
        let button = UIButton(type: .system)
        let title = NSAttributedString(string: "Post", attributes: [.font: UIFont(name: "Sarabun-SemiBold", size: 18)!, .foregroundColor: UIColor.white])
        button.setAttributedTitle(title, for: .normal)
        button.setDimensions(width: 64, height: 32)
        button.backgroundColor = .unwindRed
        button.layer.cornerRadius = 32 / 2
        button.addTarget(self, action: #selector(handlePostTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycles
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handlePostTapped() {
        print("DEBUG: Handle post tapped here...")
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        tableView.backgroundColor = .white
        tableView.register(CreateCell.self, forCellReuseIdentifier: createIdentifier)
        
        createHeader.createImageView.addGestureRecognizer(tapGesture)
        tapGesture.addTarget(self, action: #selector(handleImageViewTapped))
        
        configureNavigationUI()
    }
    
    func configureNavigationUI() {
        navigationController?.navigationBar.tintColor = .unwindRed
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage() // Removes underline view of navigation

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: postButton)
    }
}

extension CreateController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: createIdentifier, for: indexPath) as! CreateCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        createHeader.delegate = self
        return createHeader
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 128
    }
}

extension CreateController: CreateHeaderDelegate {
    @objc func handleImageViewTapped() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
}

extension CreateController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let articleImage = info[.editedImage] as? UIImage else { return }
        createHeader.createImageView.image = articleImage
        
        dismiss(animated: true, completion: nil)
    }
}
