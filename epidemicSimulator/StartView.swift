//
//  StartView.swift
//  epidemicSimulator
//
//  Created by Аня Воронцова on 25.03.2024.
//

import UIKit
import SnapKit

final class StartView : UIView {
    
    private let gsLbl = CustomLabel(text: "Group Size", size: 18)
    private let gsDscrptn = CustomLabel(text: "Количество людей в моделируемой группе", size: 12)
    let gsSldr = CustomSlider(maxValue: 1000, minValImage: "person.fill", maxValImage: "person.3.fill")
    private let gsSV = CustomStackView(spacing: 6)
    
    private let ifLbl = CustomLabel(text: "Infection Factor", size: 18)
    private let ifDscrptn = CustomLabel(text: "Количество людей, которое может быть заражено при контакте", size: 12)
    private let ifSV = CustomStackView(spacing: 6)
    let ifSldr = CustomSlider(maxValue: 10, minValImage: "hare.fill", maxValImage: "hare.fill")
    
    private let timeLbl = CustomLabel(text: "Time period", size: 18)
    private let timeDscrptn = CustomLabel(text: "Период пересчета количества зараженных людей", size: 12)
    let timeSldr = CustomSlider(maxValue: 10, minValImage: "hare.fill", maxValImage: "hare.fill")
    private let timeSV = CustomStackView(spacing: 6)
    
    let startModelButton = CustomButton(title: "Запустить моделирование")
    
    private let mainStackView = CustomStackView(spacing: 24)
    
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
        addSubview(mainStackView)
        addSubview(startModelButton)
        
        gsSV.addArrangedSubview(gsLbl)
        gsSV.addArrangedSubview(gsDscrptn)
        
        ifSV.addArrangedSubview(ifLbl)
        ifSV.addArrangedSubview(ifDscrptn)

        timeSV.addArrangedSubview(timeLbl)
        timeSV.addArrangedSubview(timeDscrptn)
        
        mainStackView.addArrangedSubview(gsSV)
        mainStackView.addArrangedSubview(gsSldr)
        mainStackView.addArrangedSubview(ifSV)
        mainStackView.addArrangedSubview(ifSldr)
        mainStackView.addArrangedSubview(timeSV)
        mainStackView.addArrangedSubview(timeSldr)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(16)
        }
        
        startModelButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(16)
        }
        
        gsSldr.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        ifSldr.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        timeSldr.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
    }
}
