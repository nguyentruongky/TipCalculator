//
//  TipAnimation.swift
//  TipCalculator
//
//  Created by Ky Nguyen on 5/10/16.
//  Copyright © 2016 Ky Nguyen. All rights reserved.
//

import UIKit

extension TipViewController {
    func setTipView(visible: Bool) {
        let height: CGFloat = visible ? 76 : view.frame.height - 200
        let opacity: CGFloat = visible ? 1 : 0

        UIView.animate(withDuration: 0.35) { [weak self] in
            self?.amountViewHeightConstraint.constant = height
            self?.view.layoutIfNeeded()
        }

        UIView.animate(withDuration: 1) { [weak self] in
            self?.tipView.alpha = opacity
            self?.totalView.alpha = opacity
        }
    }

    func setPercentPicker(visible: Bool) {
        setShowMoreButton(visible)
        UIView.animate(withDuration: 0.35) { [weak self] in
            self?.optionsViews.alpha = visible ? 1 : 0
            self?.optionLeftConstraint.constant = visible ? 16 : -84
            self?.selectedPercentButton.alpha = visible ? 0 : 1
            self?.view.layoutIfNeeded()
        }
    }
    
    func setShowMoreButton(_ value: Bool) {
        let angle: CGFloat = value ? 0 : CGFloat.pi
        UIView.animate(withDuration: 0.35) { [weak self] in
            self?.showMoreOptionButton.transform = CGAffineTransform(rotationAngle: angle)
        }   
    }
}
