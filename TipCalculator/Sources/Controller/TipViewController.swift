//
//  TipViewController.swift
//  TipCalculator
//
//  Created by Ky Nguyen on 5/10/16.
//  Copyright © 2016 Ky Nguyen. All rights reserved.
//

import UIKit

protocol TipControllerDelegate: class {
    func didSelectPercent(atIndex index: Int)
}

class TipViewController: UIViewController {
    var tipPercent = 0
    var didPickerShow = false

    @IBOutlet weak var selectedPercentButton: UIButton!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var amountViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var percentButtons: [UIButton]!
    @IBOutlet weak var showMoreOptionButton: UIButton!
    @IBOutlet weak var optionsViews: UIView!
    @IBOutlet weak var optionLeftConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tipView: UIView!
    @IBOutlet weak var tipMoneyLabel: UILabel!
    
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func showSetting(sender: AnyObject) {
        let controller = SettingViewController.create()
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func setupView() {
        prepareUI()
        getDefaultValue()
        addButtonTarget()
        setPercentPicker(visible: false)
    }
    
    func prepareUI() {
        tipView.alpha = 0
        totalView.alpha = 0
        amountTextField.becomeFirstResponder()
        amountViewHeightConstraint.constant = view.frame.height - 200
        setShowMoreButton(false)
        setUIForSmallScreen()
    }

    func setUIForSmallScreen() {
        if UIScreen.main.bounds.size.height < 568 {
            amountTextField.font = UIFont.boldSystemFont(ofSize: 40)
            totalLabel.font = UIFont.boldSystemFont(ofSize: 50)
        }
    }
    
    func getDefaultValue() {
        let percent = SettingStorage.defaultPercent
        tipPercent = percent
        selectedPercentButton.setTitle("\(percent)%", for: .normal)
        selectedPercentButton.alpha = 1

        setPercentPicker(visible: false)
    }
    
    func addButtonTarget() {
        showMoreOptionButton.addTarget(self, action: #selector(showHidePercentPicker), for: UIControl.Event.touchUpInside)
        selectedPercentButton.addTarget(self, action: #selector(showHidePercentPicker), for: UIControl.Event.touchUpInside)
        
        for button in percentButtons {
            button.addTarget(self, action: #selector(pickPercent), for: UIControl.Event.touchUpInside)
        }
    }
    
    @objc func pickPercent(sender: UIButton) {
        let percent = sender.tag / 10
        selectedPercentButton.setTitle("\(percent)%", for: .normal)
        tipPercent = percent
        showHidePercentPicker()
        updateAmount(billAmount: amountTextField.text!)
    }
    
    func updateAmount(billAmount: String) {
        guard let billAmount = Double(billAmount) else { return }

        let tip = TipLogic.calculateTip(amount: billAmount, tipPercent: tipPercent)
        self.tipMoneyLabel.text = "$\(tip)"

        let total = TipLogic.calculateTotal(amount: billAmount, tip: tip)
        totalLabel.text = "$\(total)"
    }
    
    @objc func showHidePercentPicker() {
        didPickerShow = !didPickerShow
        setPercentPicker(visible: didPickerShow)
    }
}
