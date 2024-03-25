//
//  UserDataDelegate.swift
//  epidemicSimulator
//
//  Created by Аня Воронцова on 25.03.2024.
//

import Foundation

protocol UserDataDelegate: AnyObject {
    func sendGS() -> Int
    func sendIF() -> Int
    func sendTime() -> Int
}
