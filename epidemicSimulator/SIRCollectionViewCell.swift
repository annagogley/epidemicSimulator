//
//  CollectionViewCell.swift
//  epidemicSimulator
//
//  Created by Аня Воронцова on 27.03.2024.
//

import UIKit

class SIRCollectionViewCell : UICollectionViewCell {
    static let cellId = "Cell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(healthStatus: HealthStatus) {
        layer.cornerRadius = 5
        switch healthStatus {
        case .infected :
            backgroundColor = .red
        case .suspectible:
            backgroundColor = .lightGray
        }
    }
}

enum HealthStatus {
    case suspectible, infected
}
