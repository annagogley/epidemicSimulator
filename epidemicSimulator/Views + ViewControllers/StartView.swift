//
//  StartView.swift
//  epidemicSimulator
//
//  Created by Аня Воронцова on 25.03.2024.
//

import UIKit
import SnapKit

final class StartView : UIView {
    
    private let gsLbl = CustomLabel(text: "Размер группы", size: 18)
    private let gsDscrptn = CustomLabel(text: "Количество людей в моделируемой группе. От 0 до Int.max. Если будет введено некорректное значение, то группа будет из 100 человек", size: 12)
    let gsTf = CustomTextField(placeholder: "Введите количество людей")
    private let gsSV = CustomStackView(spacing: 6)
    
    private let ifLbl = CustomLabel(text: "Инфекционный фактор", size: 18)
    private let ifDscrptn = CustomLabel(text: "Количество людей, которое может быть заражено при контакте. Максимальное количество соседей - 8", size: 12)
    private let ifSV = CustomStackView(spacing: 6)
    let ifSldr = CustomSlider(minValue: 2, maxValue: 9, minValImage: "microbe.fill", maxValImage: "allergens.fill")
    
    private let timeLbl = CustomLabel(text: "Временной период", size: 18)
    private let timeDscrptn = CustomLabel(text: "Период пересчета количества зараженных людей, от 1 до 10 секунд", size: 12)
    let timeSldr = CustomSlider(minValue: 1, maxValue: 10, minValImage: "hare.fill", maxValImage: "tortoise.fill")
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
        mainStackView.addArrangedSubview(gsTf)
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
        
        gsTf.snp.makeConstraints { make in
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
