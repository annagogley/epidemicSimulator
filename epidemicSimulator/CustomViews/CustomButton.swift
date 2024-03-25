//
//  CustomButton.swift
//  epidemicSimulator
//
//  Created by Аня Воронцова on 25.03.2024.
//

import UIKit
import SnapKit

final class CustomButton: UIButton {
    
    //MARK: - private property
    
    //MARK: - initialization
    init(title: String) {
        super.init(frame: .zero)
        setupButton(with: title)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - override methods
    
    //MARK: - private methods
    private func setupButton(with title: String) {
        backgroundColor = .systemBlue
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 26
        snp.makeConstraints { make in
            make.height.equalTo(52)
        }
    }
}

