//
//  TipViewController.swift
//  TipCalculator
//
//  Created by Ky Nguyen on 5/10/16.
//  Copyright © 2016 Ky Nguyen. All rights reserved.
//

import UIKit

protocol TipControllerDelegate {
 
    func didSelectDefaultPercent(percent: Int, atIndex index: Int)
}

class TipViewController: UIViewController {
    
    let leftDistance = (fifteen: CGFloat(63), twenty: CGFloat(110), showMore: CGFloat(160))
    
    var tipPercent = 0
    var didTipViewShow = false
    var didPickerShow = false
    weak var defaultPercentButton : UIButton!
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var amountViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var percentButtons: [UIButton]!
    @IBOutlet var buttonLeftConstraints: [NSLayoutConstraint]!
    @IBOutlet weak var showMoreOptionButton: UIButton!
    
    @IBOutlet weak var tipView: UIView!
    @IBOutlet weak var tipMoneyLabel: UILabel!
    
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    @IBAction func showSetting(sender: AnyObject) {
        
        let settingController = self.storyboard?.instantiateViewControllerWithIdentifier("SettingViewController") as! SettingViewController
        settingController.delegate = self
        self.navigationController?.pushViewController(settingController, animated: true)
    }
    
    func setupView() {
    
        billAmountTextField.delegate = self
        prepareUI()
        setupDefaultValue()
        addButtonTarget()
    }
    
    func prepareUI() {
        
        self.tipView.alpha = 0
        self.totalView.alpha = 0
        billAmountTextField.placeholder = "$"
        billAmountTextField.text = ""
        billAmountTextField.becomeFirstResponder()
        amountViewHeightConstraint.constant = self.view.frame.height - 200
        rotateShowMoreButton(!didPickerShow)
        
        if UIScreen.mainScreen().bounds.size.height < 568 {
            
            billAmountTextField.font = UIFont.systemFontOfSize(40)
            totalLabel.font = UIFont.systemFontOfSize(50)
        }
    }
    
    func setupDefaultValue() {
        
        let defaultPercentIndex = SettingStorage.loadDefaultPercentIndex()
        defaultPercentButton = percentButtons[defaultPercentIndex]
        tipPercent = defaultPercentIndex * 5 + 10
        
        hidePercentPicker()
        showDefaultPercent()
    }
    
    func addButtonTarget() {
        
        showMoreOptionButton.addTarget(self, action: #selector(showHidePercentPicker), forControlEvents: UIControlEvents.TouchUpInside)
        
        for button in percentButtons {
            button.addTarget(self, action: #selector(pickPercentTip(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        }
    }
    
    func pickPercentTip(sender: UIButton) {
        defaultPercentButton = sender
        tipPercent = sender.tag / 10
        showHidePercentPicker()
        calculateMoneyWithBillData(billAmountTextField.text!)
    }
    
    func calculateMoneyWithBillData(bill: String) {
        
        guard bill != "" else { return }
        
        let billAmount = Double(bill)!
        let tip = TipLogic.calculateTipWithBillAmount(billAmount, tipPercent: tipPercent)
        self.tipMoneyLabel.text = "$\(tip)"
        let total = TipLogic.calculateTotalWithBillAmount(billAmount, tip: tip)
        self.totalLabel.text = "$\(total)"
    }
    
    func showHidePercentPicker() {
        
        guard didPickerShow == true else { hidePercentPicker() ; return }
        showPercentPicker()
    }

    
    
}
