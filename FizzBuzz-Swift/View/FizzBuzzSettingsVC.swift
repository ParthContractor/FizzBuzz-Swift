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

    public let fizzBuzzConfigObject : PublishSubject<FizzBuzzConfigModel> = PublishSubject()
    
    private var configurationDict = AppConstants.defaultConfig
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    private func initialSetUp() {
        self.title = "Settings"
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        let btnDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        navigationItem.rightBarButtonItem = btnDone
    }

    // MARK: - Actions/Events
    @objc func doneTapped() {
        let configModel = FizzBuzzConfigModel(configDict: configurationDict)
        self.fizzBuzzConfigObject.onNext(configModel)
        UIView.transition(with: (self.navigationController?.view)!, duration: 0.75, options: .transitionFlipFromLeft, animations: {
            _ = self.navigationController?.popViewController(animated: false)
        })
    }

}
