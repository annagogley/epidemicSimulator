//
//  CustomLabel.swift
//  epidemicSimulator
//
//  Created by Аня Воронцова on 25.03.2024.
//

import UIKit
import SnapKit

final class CustomLabel: UILabel {
    
    //MARK: - initialization
    init(text: String, size: CGFloat) {
        super.init(frame: .zero)
        setupLabel(with: text, size: size)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - override methods
    
    //MARK: - private methods
    private func setupLabel(with text: String, size: CGFloat) {
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        
        attributedText = attributedString
        font = UIFont.systemFont(ofSize: size, weight: .medium)
        
        numberOfLines = 0
        self.textColor = .black
    }
}

