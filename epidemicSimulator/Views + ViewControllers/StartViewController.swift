//
//  ViewController.swift
//  epidemicSimulator
//
//  Created by Аня Воронцова on 25.03.2024.
//

import UIKit

class StartViewController: UIViewController {
    
    private let startView = StartView()
    
//MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Set parameters"
        self.view = startView
        setupButtons()
        view.addGestureRecognizer(tap)
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
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: - UserDataDelegate protocol conformation

extension StartViewController : UserDataDelegate {
    func getGroupSize() -> Int {
        guard let value = (Int(startView.gsTf.text!)) else {
            return 100
        }
        return abs(value)
    }
    
    func getInfectionFactor() -> Int {
        return Int(round(startView.ifSldr.value))
    }
    
    func getTimePeriod() -> Double {
        return Double(round(startView.timeSldr.value))
    }
}
