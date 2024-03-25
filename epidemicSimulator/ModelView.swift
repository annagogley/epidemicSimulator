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
    
    init(frame: CGRect, gsLbl: String, ifLbl: String, timeLbl: String) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews(gsLbl: gsLbl, ifLbl: ifLbl, timeLbl: timeLbl)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(gsLbl: String, ifLbl: String, timeLbl: String) {
        addSubview(stackView)
        stackView.addArrangedSubview(CustomLabel(text: gsLbl, size: 18))
        stackView.addArrangedSubview(CustomLabel(text: ifLbl, size: 18))
        stackView.addArrangedSubview(CustomLabel(text: timeLbl, size: 18))
        addSubview(drawSquare())
        setupConstraints()
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(32)
        }
    }
    
    func drawSquare() -> UIView {
        let rect = CGRect(x: 16, y: 275, width: bounds.width - 32, height: bounds.width - 32)
        let v = UIView(frame: rect)
        v.layer.borderColor = UIColor.red.cgColor
        v.layer.borderWidth = 3
        return v
    }
}

