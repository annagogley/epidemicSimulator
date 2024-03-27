//
//  ModelView.swift
//  epidemicSimulator
//
//  Created by Аня Воронцова on 25.03.2024.
//

import UIKit
import SnapKit

final class ModelView: UIView {
    
    private let stackView = CustomStackView(spacing: 12)
    var infectedLabel = CustomLabel(text: "Количество зараженных", size: 18)
    var suspectibleLable = CustomLabel(text: "Количество здоровых", size: 18)
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(stackView)
        stackView.addArrangedSubview(infectedLabel)
        stackView.addArrangedSubview(suspectibleLable)
        setupConstraints()
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().offset(32)
            make.bottom.equalToSuperview().inset(32)
        }
    }
}
