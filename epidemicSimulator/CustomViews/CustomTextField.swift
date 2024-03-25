//
//  CustomTextField.swift
//  epidemicSimulator
//
//  Created by Аня Воронцова on 25.03.2024.
//

import UIKit
import SnapKit

final class CustomTextField: UITextField {
    
    //MARK: - private property
    private let textPadding = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
    
    //MARK: - initialization
    init(placeholder: String) {
        super.init(frame: .zero)
        setupTextField(with: placeholder)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - override methods
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textPadding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textPadding)
    }
    
    //MARK: - private methods
    private func setupTextField(with placeholder: String) {
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textAlignment = .left

        layer.cornerRadius = 12
        layer.backgroundColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
        font = .systemFont(ofSize: 18)
        
        snp.makeConstraints { make in
            make.height.equalTo(57)
        }
    }
}

