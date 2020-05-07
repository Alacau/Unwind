//
//  SignInController.swift
//  Unwind
//
//  Created by Alan Cao on 5/6/20.
//  Copyright © 2020 Alan Cao. All rights reserved.
//

import UIKit

class SignInController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var emailViewContainer: UIView = {
        let image = UIImage(named: "email")!
        let view = Utilities().inputContainerView(withImage: image, textField: emailTextField)
        return view
    }()
    
    private lazy var passwordViewContainer: UIView = {
        let image = UIImage(named: "password")!
        let view = Utilities().inputContainerView(withImage: image, textField: passwordTextField)
        return view
    }()
    
    private let emailTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "Email")
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let signInButton: UIButton = {
        let button = Utilities().authButton(title: "Sign In")
        button.addTarget(self, action: #selector(handleSignInTapped), for: .touchUpInside)
        return button
    }()
    
    private let signInImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sign-in")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Lifecycles
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleSignInTapped() {
        // Authenticate user and switch view to main tab view
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        configureNavigationUI()
        
        let stack = UIStackView(arrangedSubviews: [emailViewContainer, passwordViewContainer, signInButton])
        stack.axis = .vertical
        stack.spacing = 16
        view.addSubview(stack)
        signInButton.anchor(height: 52)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
        
        view.addSubview(signInImageView)
        signInImageView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, height: view.frame.height / 2)
    }
    
    func configureNavigationUI() {
        navigationController?.navigationBar.tintColor = .unwindRed
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.font : UIFont(name: "Sarabun-Bold", size: 36)!]
        title = "Sign In"
    }
}
