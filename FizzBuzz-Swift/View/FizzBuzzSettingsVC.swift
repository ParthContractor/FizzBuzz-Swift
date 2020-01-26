//
//  FizzBuzzSettingsVC.swift
//  FizzBuzz-Swift
//
//  Created by Parth on 26/01/20.
//  Copyright © 2020 Parth. All rights reserved.
//

import UIKit
import RxSwift

class FizzBuzzSettingsVC: UIViewController {
        
    var viewModel = FizzBuzzSettingsViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    private func initialSetUp() {
        self.title = "Settings"
        self.navigationItem.setHidesBackButton(true, animated: false)
        let btnAdd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        let btnDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        navigationItem.rightBarButtonItems = [btnDone, btnAdd]
    }

    // MARK: - Actions/Events
    @objc func addTapped() {
        let alert = UIAlertController(title: "Add New Key/Value Pair", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.textColor = UIColor.ThemeColor.appThemeColor
            textField.borderStyle = .roundedRect
            textField.keyboardType = .numberPad
            textField.placeholder = "Enter key"
        })
        
        alert.addTextField(configurationHandler: { textField in
            textField.textColor = UIColor.ThemeColor.appThemeColor
            textField.borderStyle = .roundedRect
            textField.keyboardType = .default
            textField.placeholder = "Enter value"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            if let key = alert.textFields?.first?.text, let value = alert.textFields?[1].text, let intKey = Int(key) {
                self.viewModel.updateConfigDict(intKey, value)
            }
        }))
        
        present(alert, animated: true)
    }
    
    @objc func doneTapped() {
        let configModel = FizzBuzzConfigModel(configDict: viewModel.configurationDict)
        viewModel.fizzBuzzConfigObject.onNext(configModel)
        UIView.transition(with: (self.navigationController?.view)!, duration: 0.75, options: .transitionFlipFromLeft, animations: {
            _ = self.navigationController?.popViewController(animated: false)
        })
    }

}
