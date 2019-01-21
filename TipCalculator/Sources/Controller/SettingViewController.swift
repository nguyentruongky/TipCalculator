//
//  SettingViewController.swift
//  TipCalculator
//
//  Created by Ky Nguyen on 5/10/16.
//  Copyright © 2016 Ky Nguyen. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    static func create() -> SettingViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
    }
    
    weak var delegate: TipControllerDelegate!
    @IBOutlet weak var options: UISegmentedControl!
    @IBAction func didSelectPercent(sender: UISegmentedControl) {
        let percent = TipLogic.convertIndexToPercent(sender.selectedSegmentIndex)
        SettingStorage.defaultPercent = percent
        delegate.didSelectPercent(atIndex: sender.selectedSegmentIndex)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPercent()
    }

    func getPercent() {
        let percent = SettingStorage.defaultPercent
        let selectedIndex = TipLogic.convertPercentToIndex(percent)
        options.selectedSegmentIndex = selectedIndex
    }
}
