//
//  FavoritesController.swift
//  Unwind
//
//  Created by Alan Cao on 5/11/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "FavoritesCell"

class FavoritesController: UITableViewController {
    
    // MARK: - Properties
    
    var user: User?
    
    var articles = [Articles]() {
        didSet { tableView.reloadData() }
    }
    
    
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchCurrentUser()
    }
    
    // MARK: - API
    
    func fetchCurrentUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        UserService.shared.fetchCurrentUser(uid: uid) { (user) in
            self.user = user
            self.fetchFavorites()
        }
    }
    
    func fetchFavorites() {
        guard let user = user else { return }
        ArticleService.shared.fetchFavorites(forUser: user) { (articles) in
            self.articles = articles
        }
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        tableView.backgroundColor = .white
        tableView.register(FavoritesCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .none
        configureNavigationUI()
    }
    
    func configureNavigationUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.font : UIFont(name: "Sarabun-Bold", size: 36)!]
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage() // Removes underline view of navigation
        navigationItem.title = "Favorites"
        navigationItem.searchController = UISearchController(searchResultsController: nil)
    }
}

extension FavoritesController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FavoritesCell
        return cell
    }
    
    // We know that all these articles are favorited so we can start
    // each article with a favorited-filled icon and handle it from there
}
