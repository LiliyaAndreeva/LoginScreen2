//
//  ViewController.swift
//  LoginScreen
//
//  Created by brubru on 12.12.2022.
//

import UIKit

//MARK: - AuthViewController
final class AuthViewController: UIViewController {
    
    //MARK: - Private property
    private let logoImage = UIImageView()
    
    private let emailLabel = CustomLabel(title: "Register as a new user")
    private let logInLabel = CustomLabel(title: "login with your account")
    
    private let emailButton = CustomButton(title: "Email",
                                          backgroundColor: .systemCyan,
                                          isShadow: false)
    private let logInButton = CustomButton(title: "LogIn",
                                           backgroundColor: .white,
                                           isShadow: true,
                                           titleColor: .black)
    
    private let emailContainer = UIStackView()
    private let logInContainer = UIStackView()

    //MARK: - Override mathod
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Actions
    @objc
    private func showLogInViewController() {
        let logInVC = LogInViewController()
        present(logInVC, animated: true)
    }

    @objc
    private func showEmailViewController() {
        let emailVC = EmailViewController()
        present(emailVC, animated: true)
    }
}

//MARK: - Settings View
private extension AuthViewController {
    func setupView() {
        view.backgroundColor = .mainBackground
        
        addSubViews()
        addActions()
        
        setupLogoImage()
        setupEmailContainer()
        setupLogInContainer()
        
        setupLayout()
    }
}

//MARK: - Setting
private extension AuthViewController {
    func addSubViews() {
        [logoImage, emailContainer, logInContainer].forEach { subView in
            view.addSubview(subView)
        }
    }
    
    func addActions() {
        logInButton.addTarget(self,
                              action: #selector(showLogInViewController),
                              for: .touchUpInside)
        
        emailButton.addTarget(
            self,
            action: #selector(showEmailViewController),
            for: .touchUpInside
        )
    }
    
    func setupLogoImage() {
        logoImage.image = UIImage(named: "logo")
        logoImage.contentMode = .scaleAspectFit
    }
    
    func setupEmailContainer() {
        emailContainer.axis = .vertical
        
        emailContainer.addArrangedSubview(emailLabel)
        emailContainer.addArrangedSubview(emailButton)
    }
    
    func setupLogInContainer() {
        logInContainer.axis = .vertical
        
        logInContainer.addArrangedSubview(logInLabel)
        logInContainer.addArrangedSubview(logInButton)
    }
    
    
}

//MARK: - Layout
private extension AuthViewController {
    func setupLayout() {
        [logoImage, logInLabel,
         logInButton, emailLabel,
         emailButton, emailContainer, logInContainer].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.66),
            logoImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33),
            
            emailContainer.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 10),
            emailContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailContainer.heightAnchor.constraint(equalToConstant: 150),
            
            logInContainer.topAnchor.constraint(equalTo: emailContainer.bottomAnchor, constant: 50),
            logInContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            logInContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            logInContainer.heightAnchor.constraint(equalToConstant: 150)
            
        ])
    }
}
