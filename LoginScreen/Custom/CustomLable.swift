//
//  CustomLable.swift
//  LoginScreen
//
//  Created by brubru on 12.12.2022.
//

import UIKit

final class CustomLabel: UILabel {
    
    init(title: String) {
        super.init(frame: .zero)
        
        setupSelfLabel(title: title)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSelfLabel(title: String) {
        text = title
        font = .boldSystemFont(ofSize: 18)
        textColor = .white
    }
    
}

