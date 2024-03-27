//
//  UserDataDelegate.swift
//  epidemicSimulator
//
//  Created by Аня Воронцова on 25.03.2024.
//

import Foundation

protocol UserDataDelegate: AnyObject {
    func getGroupSize() -> Int
    func getInfectionFactor() -> Int
    func getTimePeriod() -> Double
}
