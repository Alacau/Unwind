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
    
    private var filteredArticles = [Articles]() {
        didSet { tableView.reloadData() }
    }
    
    private var inSearchMode: Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    
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
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.placeholder = "Search for favorited articles"
        navigationItem.searchController = searchController
    }
}

extension FavoritesController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inSearchMode ? filteredArticles.count : articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FavoritesCell
        let article = inSearchMode ? filteredArticles[indexPath.row] : articles[indexPath.row]
        cell.articles = article
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ArticlesController(article: articles[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }    
}

extension FavoritesController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        filteredArticles = articles.filter({
            $0.title.lowercased().contains(searchText) ||
            $0.user.fullname.lowercased().contains(searchText) ||
            $0.user.username.lowercased().contains(searchText)
        })
    }
}
