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
    
    static func saveDefaultPercentIndex(percent: Int) {
        
        NSUserDefaults.standardUserDefaults().setInteger(percent, forKey: keyDefaultPercent)
    }
    
    static func loadDefaultPercentIndex() -> Int {
        
        let value = NSUserDefaults.standardUserDefaults().integerForKey(keyDefaultPercent)
        return value
    }
}

struct TipLogic {
    
    static func calculateTipWithBillAmount(amount: Double, tipPercent percent: Int) -> Double {
    
        return amount * Double(percent) / 100
    }
    
    static func calculateTotalWithBillAmount(amount: Double, tip tipAmount: Double) -> Double {
        
        return amount + tipAmount
    }
}