//
//  ViewController.swift
//  epidemicSimulator
//
//  Created by Аня Воронцова on 25.03.2024.
//

import UIKit
import SnapKit

class StartViewController: UIViewController {
    
    private let startView = StartView()
    
//MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Specify parameters"
        self.view = startView
        setupButtons()
    }
}

extension StartViewController {
    func setupButtons() {
        startView.startModelButton.addTarget(self, action: #selector(self.goToModelVC), for: .touchUpInside)
    }
    
    @objc func goToModelVC() {
        let destination = ModelViewController()
        navigationController?.pushViewController(destination, animated: true)
        destination.delegate = self
    }
}

//MARK: - UserDataDelegate protocol conformation

extension StartViewController : UserDataDelegate {
    func sendGS() -> Int {
        return Int(round(startView.gsSldr.value))
    }
    
    func sendIF() -> Int {
        return Int(round(startView.ifSldr.value))
    }
    
    func sendTime() -> Int {
        return Int(round(startView.timeSldr.value))
    }
}
