//
//  CustomSlider.swift
//  epidemicSimulator
//
//  Created by Аня Воронцова on 25.03.2024.
//

import UIKit
import SnapKit

final class CustomSlider: UISlider {
    
    //MARK: - initialization
    init(minValue: Int, maxValue: Int, minValImage: String, maxValImage: String) {
        super.init(frame: .zero)
        setupSlider(minValue: minValue, maxValue: maxValue, minValImage: minValImage, maxValImage: maxValImage)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - private methods
    private func setupSlider(minValue: Int,
                             maxValue: Int,
                             minValImage: String,
                             maxValImage: String) {
        minimumValue = Float(minValue)
        maximumValue = Float(maxValue)
        minimumValueImage = UIImage(systemName: minValImage)
        maximumValueImage = UIImage(systemName: maxValImage)
        tintColor = .systemBlue
        value = maximumValue / 2
    }
}


