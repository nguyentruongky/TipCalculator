//
//  SettingViewController.swift
//  TipCalculator
//
//  Created by Ky Nguyen on 5/10/16.
//  Copyright © 2016 Ky Nguyen. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    var delegate: TipControllerDelegate!
    
    @IBOutlet weak var defaultPercentSelection: UISegmentedControl!
    @IBAction func selectDefaultPercent(sender: UISegmentedControl) {
        
        let percent = sender.selectedSegmentIndex * 5 + 10
        SettingStorage.saveDefaultPercentIndex(sender.selectedSegmentIndex)
        delegate.didSelectDefaultPercent(percent, atIndex: sender.selectedSegmentIndex)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        defaultPercentSelection.selectedSegmentIndex = SettingStorage.loadDefaultPercentIndex()
    }
}
