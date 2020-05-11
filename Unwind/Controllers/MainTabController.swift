//
//  MainTabController.swift
//  Unwind
//
//  Created by Alan Cao on 5/11/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

class MainTabController: UITabBarController {
   
    // MARK: - Properties
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureTabs()
    }
    
    func configureTabs() {
        // Embed controllers in navigation controller
        let articles = FeedController()
        let articlesNav = createTabControllers(image: UIImage(named: "articles"), title: "Articles", viewController: articles)
        
        let search = SearchController()
        let searchNav = createTabControllers(image: UIImage(named: "search"), title: "Search", viewController: search)
        
        let user = UserController()
        let userNav = createTabControllers(image: UIImage(named: "user"), title: "Profile", viewController: user)
        
        let favorites = FavoritesController()
        let favoritesNav = createTabControllers(image: UIImage(named: "favorites"), title: "Favorites", viewController: favorites)

        let notifications = NotificationsController()
        let notificationsNav = createTabControllers(image: UIImage(named: "notifications"), title: "Notifications", viewController: notifications)

        viewControllers = [articlesNav, searchNav, userNav, favoritesNav, notificationsNav]
        
        tabBar.barTintColor = .white
        tabBar.tintColor = .unwindRed
        tabBar.unselectedItemTintColor = .black
    }
    
    func createTabControllers(image: UIImage?, title: String, viewController: UIViewController) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.tabBarItem.image = image
        navigation.title = title
        
        return navigation
    }
}
