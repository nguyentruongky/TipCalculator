//
//  TipAnimation.swift
//  TipCalculator
//
//  Created by Ky Nguyen on 5/10/16.
//  Copyright © 2016 Ky Nguyen. All rights reserved.
//

import UIKit

extension TipViewController {
    
    func showTipView() {
        
        guard didTipViewShow == false else { return }
        
        didTipViewShow = true
        
        UIView.animateWithDuration(0.35) {
            
            self.amountViewHeightConstraint.constant = 76
            self.view.layoutIfNeeded()
        }
        
        UIView.animateWithDuration(1) {
            
            self.tipView.alpha = 1
            self.totalView.alpha = 1
        }
    }
    
    func hideTipView() {
        
        guard didTipViewShow == true else { return }
        
        didTipViewShow = false
        
        UIView.animateWithDuration(0.35) {
            
            self.amountViewHeightConstraint.constant = self.view.frame.height - 200
            self.view.layoutIfNeeded()
        }
        
        UIView.animateWithDuration(1) {
            
            self.tipView.alpha = 0
            self.totalView.alpha = 0
        }
    }
    
    func showDefaultPercent() {
        
        self.defaultPercentButton.alpha = 1
    }
    
    func hidePercentPicker() {
        
        guard didPickerShow == false else { return }
        rotateShowMoreButton(didPickerShow)
        didPickerShow = true
        
        UIView.animateWithDuration(0.5) {
            
            for button in self.percentButtons {
                button.alpha = 0
            }
            self.showDefaultPercent()
            
            self.buttonLeftConstraints[0].constant = 16
            self.buttonLeftConstraints[1].constant = 16
            self.buttonLeftConstraints[2].constant = 60
            self.view.layoutIfNeeded()
        }
    }
    
    func showPercentPicker() {
        
        guard didPickerShow == true else { return }
        rotateShowMoreButton(didPickerShow)
        didPickerShow = false
    
        UIView.animateWithDuration(0.5) { 
            
            for button in self.percentButtons {
                button.alpha = 1
            }
            self.showDefaultPercent()
            
            self.buttonLeftConstraints[0].constant = self.leftDistance.fifteen
            self.buttonLeftConstraints[1].constant = self.leftDistance.twenty
            self.buttonLeftConstraints[2].constant = self.leftDistance.showMore
            self.view.layoutIfNeeded()
        }
    }
    
    func rotateShowMoreButton(didShow: Bool) {
        
        let angle: CGFloat = didShow ? 0 : CGFloat(M_PI)
        
        UIView.animateWithDuration(0.5) { 
            self.showMoreOptionButton.transform = CGAffineTransformMakeRotation(angle)
        }   
    }
}