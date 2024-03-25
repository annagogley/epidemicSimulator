//
//  CustomStackView.swift
//  epidemicSimulator
//
//  Created by Аня Воронцова on 25.03.2024.
//

import UIKit

final class CustomStackView : UIStackView  {
    
    init(spacing: CGFloat) {
        super.init(frame: .zero)
        setup(spacing: spacing)
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(spacing: CGFloat) {
        self.axis = .vertical
        self.spacing = spacing
        self.alignment = .leading
    }
}

