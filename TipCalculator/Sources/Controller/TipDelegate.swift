//
//  TipDelegate.swift
//  TipCalculator
//
//  Created by Ky Nguyen on 5/10/16.
//  Copyright © 2016 Ky Nguyen. All rights reserved.
//

import UIKit

extension TipViewController: UITextFieldDelegate  {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        let shouldShowTipView = newString.isEmpty == false
        setTipView(visible: shouldShowTipView)
        updateAmount(billAmount: newString)
        return true
    }
}

extension TipViewController: TipControllerDelegate {
    func didSelectPercentage(atIndex index: Int) {
        selectedPercentButton.alpha = 0
        let button = percentButtons[index]
        selectedPercentButton.setTitle(button.title(for: .normal), for: .normal)
        selectedPercentButton.alpha = 1
        tipPercent = TipLogic.convertIndexToPercentage(index)
        updateAmount(billAmount: amountTextField.text!)
    }
}
