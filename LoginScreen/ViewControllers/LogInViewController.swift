//
//  LogInViewController.swift
//  LoginScreen
//
//  Created by brubru on 13.12.2022.
//

import UIKit

//MARK: - LogInViewController
class LogInViewController: UIViewController {
    
    //MARK: - Private Property
    private let bgView = UIView()
    
    private let welcomImage = UIImageView()
    
    private let emailLabel = CustomLabel(title: "Email")
    private let passwordLabel = CustomLabel(title: "Password")
    
    private let emailTextField = RegisterTextField(placeholder: "  Enter your email")
    private let passwordTextField = RegisterTextField(placeholder: "  Enter your password", isPrivate: true)
    
    private let logInButton = CustomButton(title: "Log In",
                                           backgroundColor: .white,
                                           isShadow: true,
                                           titleColor: .black)
    
    private let quastionLabel = CustomLabel(title: "Need an account?")
    private let linkButton = UIButton()
    
    private let emailContainer = UIStackView()
    private let passwordContainer = UIStackView()
    private let singUpContainer = UIStackView()
    
    //MARK: - Override Metods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Settings View
private extension LogInViewController {
    func setupView() {
        view.backgroundColor = .systemYellow
        
        addSubViews()
        
        setupBgView()
        setupLogoImage()
        setupLinkButton()
        
        setupConteiner(
            stackView: emailContainer,
            topLabel: emailLabel,
            bottomTF: emailTextField
        )
        
        setupConteiner(
            stackView: passwordContainer,
            topLabel: passwordLabel,
            bottomTF: passwordTextField
        )
        
        setupSingUpContainer()
        
        setupLayout()
    }
}

//MARK: - Setting
private extension LogInViewController {
    func addSubViews() {
        [welcomImage, bgView, emailContainer,
         passwordContainer, logInButton, singUpContainer].forEach { subView in
            view.addSubview(subView)
        }
    }
    
    func setupBgView() {
        bgView.backgroundColor = .mainBackground
    }
    
    func setupLogoImage() {
        welcomImage.image = UIImage(named: "logIn")
        welcomImage.contentMode = .scaleAspectFit
    }
    
    func setupLinkButton() {
        linkButton.setTitle("Sing Up", for: .normal)
        linkButton.setTitleColor(.systemPink, for: .normal)
        linkButton.setTitleColor(.highlightedColor, for: .highlighted)
        linkButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
    }
    
    func setupConteiner(stackView: UIStackView, topLabel: UILabel, bottomTF: UITextField) {
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(topLabel)
        stackView.addArrangedSubview(bottomTF)
    }
    
    func setupSingUpContainer() {
        singUpContainer.axis = .horizontal
        
        singUpContainer.addArrangedSubview(quastionLabel)
        singUpContainer.addArrangedSubview(linkButton)
    }
    
}

//MARK: - Layout
private extension LogInViewController {
    func setupLayout() {
        [bgView, welcomImage, emailLabel, emailTextField, emailContainer, passwordLabel, passwordTextField, passwordContainer, logInButton, quastionLabel, linkButton, singUpContainer].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        NSLayoutConstraint.activate([
            welcomImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            welcomImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.30),
            welcomImage.heightAnchor.constraint(equalTo: welcomImage.widthAnchor),
            
            bgView.topAnchor.constraint(equalTo: welcomImage.bottomAnchor, constant: 10),
            bgView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bgView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            emailContainer.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 50),
            emailContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            passwordContainer.topAnchor.constraint(equalTo: emailContainer.bottomAnchor, constant: 50),
            passwordContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            logInButton.topAnchor.constraint(equalTo: passwordContainer.bottomAnchor, constant: 70),
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            singUpContainer.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            singUpContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            singUpContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
        ])
    }
}
