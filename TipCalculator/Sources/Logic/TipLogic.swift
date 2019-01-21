//
//  TipLogic.swift
//  TipCalculator
//
//  Created by Ky Nguyen on 5/11/16.
//  Copyright © 2016 Ky Nguyen. All rights reserved.
//

import Foundation

let keyDefaultPercent = "defaulPercent"

struct SettingStorage {
    static var defaultPercentage: Int {
        get {
            return UserDefaults.standard.value(forKeyPath: keyDefaultPercent) as? Int ?? 10
        }
        set {
            UserDefaults.standard.setValue(defaultPercentage, forKeyPath: keyDefaultPercent)
        }
    }
}

struct TipLogic {
    static func calculateTip(amount: Double, tipPercent percent: Int) -> Double {
        return amount * Double(percent) / 100
    }
    
    static func calculateTotal(amount: Double, tip tipAmount: Double) -> Double {
        return amount + tipAmount
    }

    static func convertIndexToPercentage(_ index: Int) -> Int {
        return index * 5 + 10
    }

    static func convertPercentageToIndex(_ percentage: Int) -> Int {
        return (percentage - 10) / 5
    }
}
