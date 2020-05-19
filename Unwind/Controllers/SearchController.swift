//
//  SearchController.swift
//  Unwind
//
//  Created by Alan Cao on 5/11/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ArticleCell"

class SearchController: UITableViewController {
    
    // MARK: - Properties
    
    private var articles = [Articles]() {
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
        fetchArticles()
    }
    
    // MARK: - API
    
    func fetchArticles() {
        ArticleService.shared.fetchArticles { (articles) in
            self.articles = articles
        }
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        configureNavigationUI()
        
        tableView.register(ArticleCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView()
    }
    
    func configureNavigationUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.font : UIFont(name: "Sarabun-Bold", size: 36)!]
        navigationItem.title = "Search"
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.placeholder = "Search for articles"
        navigationItem.searchController = searchController
        definesPresentationContext = false
        
    }
}

extension SearchController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inSearchMode ? filteredArticles.count : articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ArticleCell
        let article = inSearchMode ? filteredArticles[indexPath.row] : articles[indexPath.row]
        cell.article = article
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = inSearchMode ? filteredArticles[indexPath.row] : articles[indexPath.row]
        let controller = ArticlesController(article: article)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension SearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        print(searchText)
        
        filteredArticles = articles.filter({ $0.title.lowercased().contains(searchText) })
    }
}
