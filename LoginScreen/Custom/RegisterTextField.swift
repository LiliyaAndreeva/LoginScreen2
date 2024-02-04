//
//  RegisterTextField.swift
//  LoginScreen
//
//  Created by brubru on 15.12.2022.
//

import UIKit

//MARK: - RegisterTextField
final class RegisterTextField: UITextField {
    
    //MARK: - Initilazer
    init(placeholder: String, isPrivate: Bool = false) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder, isPrivate: isPrivate)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func setupTextField(placeholder: String, isPrivate: Bool) {
        textColor = .white
        
        layer.cornerRadius = 10
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.white.cgColor
        layer.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemCyan])
        font = .boldSystemFont(ofSize: 18)
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        if isPrivate {
            isSecureTextEntry = true
        }
    }
}
