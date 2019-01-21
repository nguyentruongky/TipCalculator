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
    static var defaultPercent: Int {
        get {
            return UserDefaults.standard.value(forKeyPath: keyDefaultPercent) as? Int ?? 10
        }
        set {
            UserDefaults.standard.setValue(defaultPercent, forKeyPath: keyDefaultPercent)
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

    static func convertIndexToPercent(_ index: Int) -> Int {
        return index * 5 + 10
    }

    static func convertPercentToIndex(_ percent: Int) -> Int {
        return (percent - 10) / 5
    }
}
