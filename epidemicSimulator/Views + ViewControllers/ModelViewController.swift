//
//  ModelViewController.swift
//  epidemicSimulator
//
//  Created by Аня Воронцова on 25.03.2024.
//

import UIKit
import SnapKit

class ModelViewController: UIViewController, UICollectionViewDelegate {
    
    //MARK: - Properties
    weak var delegate : UserDataDelegate?

    let lock = NSLock()
    var timer : Timer?
    
    var totalPeople : Int = 1
    var infectionFactor : Int = 1
    var timePeriod : Double = 1
    
    var newInfectedGroup = [Int]()
    var indiciesToReload = [IndexPath]()
    var healthStatusArray : [HealthStatus] = []
    var infectedIndicies = [Int]()
    
    var collectionView: UICollectionView!
    
    private let stackView = CustomStackView(spacing: 12)
    var infectedLabel = CustomLabel(text: K.infectedText, size: 18)
    var suspectibleLable = CustomLabel(text: K.suspectibleText, size: 18)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Модель заражения"
        
        totalPeople = delegate!.getGroupSize()
        infectionFactor = delegate!.getInfectionFactor()
        timePeriod = delegate!.getTimePeriod()
        healthStatusArray = Array(repeating: .suspectible, count: totalPeople)
        
        setupView()
        startTimer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        stopTimer()
    }
}

//MARK: - SetupView
extension ModelViewController {
    func setupView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let cellWidth = (view.frame.width - 32 - 2 * 9) / 10
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        layout.minimumLineSpacing = 2.0
        layout.minimumInteritemSpacing = 2.0
        
        collectionView = UICollectionView(frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: self.view.frame.width,
                                                        height: self.view.frame.height - 100),
                                          collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SIRCollectionViewCell.self, forCellWithReuseIdentifier: SIRCollectionViewCell.cellId)
        collectionView.showsVerticalScrollIndicator = true
        collectionView.backgroundColor = .white
        
        self.view.addSubview(collectionView)
        self.view.addSubview(stackView)
        stackView.addArrangedSubview(infectedLabel)
        stackView.addArrangedSubview(suspectibleLable)
        
        infectedLabel.text = "\(K.infectedText): \(infectedIndicies.count)"
        suspectibleLable.text = "\(K.suspectibleText): \(totalPeople - infectedIndicies.count)"
        
        stackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(32)
        }
    }
}

//MARK: - Logic
extension ModelViewController {
    //MARK: - Infect Neighbours, reload CollectionView cells
    func infectNeighbours() {
        if newInfectedGroup.count == 0 {
            stopTimer()
        }
        
        let variants = [-11, -10, -9, -1, 1, 9, 10, 11]
        let zeroVariants = [-10, -9, 1, 10, 11]
        let nineVariants = [-11, -10, -1, 9, 10]
        let iF = Array(0...infectionFactor - 1).randomElement()!
        
        for infected in newInfectedGroup {
            switch infected % 10 {
            case 0:
                infectByVariants(variants: zeroVariants, infected: infected, iF: iF)
                if !hasSusNeighbours(infected: infected, variants: zeroVariants) {
                    remove(element: infected, from: &newInfectedGroup)
                }
            case 9:
                infectByVariants(variants: nineVariants, infected: infected, iF: iF)
                if !hasSusNeighbours(infected: infected, variants: nineVariants) {
                    remove(element: infected, from: &newInfectedGroup)
                }
            default:
                infectByVariants(variants: variants, infected: infected, iF: iF)
                if !hasSusNeighbours(infected: infected, variants: variants) {
                    remove(element: infected, from: &newInfectedGroup)
                }
            }
        }
        
        print(infectedIndicies.count, totalPeople - infectedIndicies.count, newInfectedGroup)
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            collectionView.reloadItems(at: indiciesToReload)
            infectedLabel.text = "\(K.infectedText): \(infectedIndicies.count)"
            suspectibleLable.text = "\(K.suspectibleText): \(totalPeople - infectedIndicies.count)"
            indiciesToReload = []
        }
        
    }
    
    func infectByVariants(variants: [Int], infected: Int, iF: Int) {
        for _ in 0...iF {
            let newInfectedPerson = infected + variants.randomElement()!
            guard newInfectedPerson >= 0 && newInfectedPerson < totalPeople && !infectedIndicies.contains(newInfectedPerson) && healthStatusArray[newInfectedPerson] != .infected else {
                return
            }
            healthStatusArray[newInfectedPerson] = .infected
            infectedIndicies.append(newInfectedPerson)
            newInfectedGroup.append(newInfectedPerson)
            indiciesToReload.append(IndexPath(item: newInfectedPerson, section: 0))
        }
        
        remove(element: infected, from: &newInfectedGroup)
        remove(element: IndexPath(item: infected, section: 0), from: &indiciesToReload)
    }
    
    //MARK: - Is there healthy neighbours?
    func hasSusNeighbours(infected: Int, variants: [Int]) -> Bool {
        var arr = [Int]()
        for variant in variants {
            let a = infected + variant
            if a >= 0 && a < totalPeople {
                arr.append(a)
            }
        }
        for i in arr {
            if healthStatusArray[i] == .suspectible {
                return true
            }
        }
        return false
    }
    
    //MARK: - Delete Element
    func remove<T: Equatable>(element: T, from array: inout [T]) {
        lock.lock()
        if let i = array.firstIndex(where: {$0 == element}) {
            array.remove(at: i)
        }
        lock.unlock()
    }
    
    //MARK: - Timers
    func startTimer() {
        guard timer == nil else {
            return
        }
        timer = Timer.scheduledTimer(withTimeInterval: timePeriod, repeats: true) { _ in
            let queue = DispatchQueue(label: "com.annagogley.infectedQueue", qos: .background, attributes: .concurrent)
            queue.async { [weak self] in
                guard let self = self else { return }
                self.infectNeighbours()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    

}

//MARK: - UICollectionViewDataSource
extension ModelViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalPeople
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SIRCollectionViewCell.cellId, for: indexPath) as! SIRCollectionViewCell
        cell.setupCell(healthStatus: healthStatusArray[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! SIRCollectionViewCell
        guard healthStatusArray[indexPath.item] != .infected else { return }
        healthStatusArray[indexPath.item] = .infected
        newInfectedGroup.append(indexPath.item)
        selectedCell.setupCell(healthStatus: healthStatusArray[indexPath.item])
        infectedIndicies.append(indexPath.item)
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            infectedLabel.text = "\(K.infectedText): \(infectedIndicies.count)"
            suspectibleLable.text = "\(K.suspectibleText): \(totalPeople - infectedIndicies.count)"
        }
    }
}
