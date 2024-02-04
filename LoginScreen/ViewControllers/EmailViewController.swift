//
//  EmailViewController.swift
//  LoginScreen
//
//  Created by Лилия Андреева on 19.01.2024.
//

import UIKit

//MARK: - EmailViewController
final class EmailViewController: UIViewController {
    
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
    
    private let firstNameLabel = CustomLabel(title: "FirstName")
    private let firstnameTextField = RegisterTextField(placeholder: "FirstName", isPrivate: false)
    private let firstNameContainer = UIStackView()
    
    private let lastNameLabel = CustomLabel(title: "LastName")
    private let lastNameTextField = RegisterTextField(placeholder: "LastName", isPrivate: false)
    private let lastNameContainer = UIStackView()
    
    private let horisontalFullNameContainer = UIStackView()
    
    //MARK: - Override Metods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Settings View
private extension EmailViewController {
    func setupView() {
        view.backgroundColor = .systemYellow
        
        addSubViews()
        
        setupBgView()
        setupLogoImage()
        setupLinkButton()
        
        setupConteiner(stackView: firstNameContainer,
                       topLabel: firstNameLabel,
                       bottomTF: firstnameTextField)
        
        setupConteiner(stackView: lastNameContainer,
                       topLabel: lastNameLabel,
                       bottomTF: lastNameTextField)
        
        setupHorisontalFullNameContaner()
        
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
private extension EmailViewController {
    func addSubViews() {
        [welcomImage, bgView, emailContainer,
         passwordContainer, logInButton, singUpContainer,
         firstNameContainer, lastNameContainer, horisontalFullNameContainer].forEach { subView in
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
    
    func setupHorisontalFullNameContaner() {
        horisontalFullNameContainer.axis = .horizontal
        
        horisontalFullNameContainer.addArrangedSubview(firstNameContainer)
        horisontalFullNameContainer.addArrangedSubview(lastNameContainer)
    }
    
    
    
}

//MARK: - Layout
private extension EmailViewController {
    func setupLayout() {
        [bgView, welcomImage, emailLabel, emailTextField, emailContainer, passwordLabel, passwordTextField, passwordContainer, logInButton, quastionLabel, linkButton, singUpContainer,
            firstNameContainer, firstNameLabel, firstnameTextField,
            lastNameContainer, lastNameLabel,lastNameTextField].forEach { subView in
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
            
            horisontalFullNameContainer.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 30),
            horisontalFullNameContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horisontalFullNameContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            emailContainer.topAnchor.constraint(equalTo: horisontalFullNameContainer.bottomAnchor, constant: 10),
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

#Preview{
    EmailViewController()
}
