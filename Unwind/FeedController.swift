//
//  FeedController.swift
//  Unwind
//
//  Created by Alan Cao on 5/11/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

private let articleIdentifier = "ArticleCell"

class FeedController: UITableViewController {
    
    // MARK: - Properties
    
    private let createButton: UIButton = {
        let button = Utilities().createButton(image: UIImage(named: "create"))
        button.addTarget(self, action: #selector(handleCreateTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleCreateTapped() {
        let createController = UINavigationController(rootViewController: CreateController())
        createController.modalPresentationStyle = .fullScreen
        present(createController, animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        configureNavigationUI()
                
        tableView.register(ArticleCell.self, forCellReuseIdentifier: articleIdentifier)
        
        view.addSubview(createButton)
        createButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingBottom: 20, paddingRight: 20)
    }
    
    func configureNavigationUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.font : UIFont(name: "Sarabun-Bold", size: 36)!]
        navigationItem.title = "Articles"
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension FeedController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: articleIdentifier, for: indexPath) as! ArticleCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Push navigation to view article -> Implement UIScrollView?
    }
}
