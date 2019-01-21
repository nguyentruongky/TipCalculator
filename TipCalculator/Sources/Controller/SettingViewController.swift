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
    @IBAction func didSelectPercentage(sender: UISegmentedControl) {
        let percent = TipLogic.convertIndexToPercentage(sender.selectedSegmentIndex)
        SettingStorage.defaultPercentage = percent
        delegate.didSelectPercentage(atIndex: sender.selectedSegmentIndex)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPercentage()
    }

    func loadPercentage() {
        let percentage = SettingStorage.defaultPercentage
        let selectedIndex = TipLogic.convertPercentageToIndex(percentage)
        options.selectedSegmentIndex = selectedIndex
    }
}
