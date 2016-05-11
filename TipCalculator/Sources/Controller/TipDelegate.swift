//
//  TipDelegate.swift
//  TipCalculator
//
//  Created by Ky Nguyen on 5/10/16.
//  Copyright © 2016 Ky Nguyen. All rights reserved.
//

import UIKit

extension TipViewController: UITextFieldDelegate  {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let newString = NSString(string: textField.text!).stringByReplacingCharactersInRange(range, withString: string)
        guard newString != "" && Double(newString) != nil else {
            
            self.hideTipView()
            return true
        }
        showTipView()
        calculateMoneyWithBillData(newString)
        return true
    }
}

extension TipViewController: TipControllerDelegate {
    
    func didSelectDefaultPercent(percent: Int, atIndex index: Int) {
        
        defaultPercentButton.alpha = 0
        defaultPercentButton = percentButtons[index]
        showDefaultPercent()
        tipPercent = percent
        calculateMoneyWithBillData(billAmountTextField.text!)
    }
}