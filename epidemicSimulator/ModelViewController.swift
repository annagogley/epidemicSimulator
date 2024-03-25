//
//  ModelViewController.swift
//  epidemicSimulator
//
//  Created by Аня Воронцова on 25.03.2024.
//

import UIKit
import SnapKit

class ModelViewController: UIViewController, UICollectionViewDelegate {
    
    weak var delegate : UserDataDelegate?
    var collectionview: UICollectionView!
    var cellId = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Model"
        
//        view = ModelView(frame: view.frame,
//                         gsLbl: delegate?.sendGS() ?? "no information",
//                         ifLbl: delegate?.sendIF() ?? "no information",
//                         timeLbl: delegate?.sendTime() ?? "no information")
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: view.frame.width / 12, height: view.frame.width / 12)
        layout.minimumLineSpacing = 2.0
        layout.minimumInteritemSpacing = 2.0
        
        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(SIRCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = .white
        self.view.addSubview(collectionview)
    }
}


//extension ModelViewController : UICollectionViewDelegateFlowLayout {
//    
//}

extension ModelViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate!.sendGS()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SIRCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath)
        selectedCell?.contentView.layer.cornerRadius = 5
        selectedCell?.contentView.backgroundColor = .red
    }
}

class SIRCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 5
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
