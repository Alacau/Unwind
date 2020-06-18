//
//  UserController.swift
//  Unwind
//
//  Created by Alan Cao on 5/11/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "ArticleCell"

class UserController: UITableViewController {
    
    // MARK: - Properties
    
    private var user: User
    private var articles = [Articles]() {
        didSet { tableView.reloadData() }
    }
        
    // MARK: - Lifecycles
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchUserArticles()
    }
    
    // MARK: - API
    
    func fetchUserArticles() {
        ArticleService.shared.fetchUserArticles(forUser: user) { (articles) in
            self.articles = articles.sorted(by: { $0.timestamp > $1.timestamp })
        }
    }
    
    // MARK: - Selectors
    
//    @objc func handleSignOut() {
//        let alertController = UIAlertController(title: "Are you sure you want to sign out?", message: nil, preferredStyle: .actionSheet)
//        alertController.addAction(UIAlertAction(title: "Sign Out", style: .default, handler: { (action) in
//            do {
//                try Auth.auth().signOut()
//                DispatchQueue.main.async {
//                    let nav = UINavigationController(rootViewController: LandingController())
//                    nav.modalPresentationStyle = .fullScreen
//                    self.present(nav, animated: true, completion: nil)
//                }
//            } catch let error {
//                print("DEBUG: Failed to log out with error \(error.localizedDescription)")
//            }
//        }))
//        alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (action) in
//            self.dismiss(animated: true, completion: nil)
//        }))
//        present(alertController, animated: true, completion: nil)
//    }
    
    @objc func handleSettingsTapped() {
        let controller = EditProfileController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        
        configureNavigationUI()
        
        tableView.register(ArticleCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func configureNavigationUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.font : UIFont(name: "Sarabun-Bold", size: 36)!]
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage() // Removes underline view of navigation
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(handleSettingsTapped)) // Create different func handler
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title = "Profile" //  Will set this to the user's name?
    }
    
    func configureProfileHeader() -> UIView {
        let viewModel = ProfileHeaderViewModel(user: user)
        let profileHeader = ProfileHeader()
        profileHeader.fullnameLabel.text = viewModel.fullnameText
        profileHeader.usernameLabel.text = viewModel.usernameText
        return profileHeader
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension UserController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ArticleCell
        cell.article = articles[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ArticlesController(article: articles[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 152
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewModel = ProfileHeaderViewModel(user: user)
        let profileHeader = ProfileHeader()
        profileHeader.fullnameLabel.text = viewModel.fullnameText
        profileHeader.usernameLabel.text = viewModel.usernameText
        return profileHeader
    }
}
