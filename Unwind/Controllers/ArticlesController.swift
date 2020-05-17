//
//  ArticlesController.swift
//  Unwind
//
//  Created by Alan Cao on 5/17/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

class ArticlesController: UIViewController {
    
    // MARK: - Properties
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "12 reasons why Ashley’s a clown and why she’s not as basic as she thinks she is"
        label.font = UIFont(name: "Sarabun-SemiBold", size: 18)
        return label
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "This is probably going to be a subcaption for the article being viewed! :)"
        label.font = UIFont(name: "Sarabun", size: 16)
        return label
    }()
    
    private let userProfileImage: UIImageView = {
        let imageView = Utilities().simpleImageView(image: UIImage(named: "user"), cornerRadius: 44 / 2, borderWidth: 0.3)
        imageView.contentMode = .center
        imageView.setDimensions(width: 44, height: 44)
        return imageView
    }()
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Sarabun", size: 20)
        label.text = "First Last"
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Sarabun", size: 16)
        label.text = "05/17/2020"
        label.textColor = .gray
        return label
    }()
    
    private lazy var articleImage: UIImageView = {
        let imageView = Utilities().simpleImageView(image: UIImage(named: "sign-in"), cornerRadius: 10, borderWidth: 0.3)
        imageView.setDimensions(width: view.frame.width - 40, height: 200)
        return imageView
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Sarabun", size: 18)
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        let attributedString = NSMutableAttributedString(string: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?", attributes: [.paragraphStyle: paragraphStyle])
        label.attributedText = attributedString
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleCancel() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        configureNavigationUI()
        
        let userStack = UIStackView(arrangedSubviews: [userProfileImage, fullnameLabel, dateLabel])
        userStack.axis = .horizontal
        userStack.spacing = 12
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, captionLabel, userStack, articleImage, contentLabel])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        scrollView.addSubview(stack)
        stack.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: scrollView.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
    }
    
    func configureNavigationUI() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = .unwindRed
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage() // Removes underline view of navigation

        let logoImageView = UIImageView(image: UIImage(named: "nav-logo"))
        logoImageView.contentMode = .scaleAspectFill

        navigationItem.titleView = logoImageView
        
    }
}
