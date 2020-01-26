//
//  FizzBuzzVC.swift
//  FizzBuzz-Swift
//
//  Created by Parth on 25/01/20.
//  Copyright © 2020 Parth. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FizzBuzzVC: UIViewController {
    
    @IBOutlet var lblInput: UILabel!{
        didSet {
            lblInput.textColor = UIColor.ThemeColor.labelColor
            lblInput.backgroundColor = .clear
            lblInput.font = UIFont.ThemeFont.titleFont
        }
    }
    @IBOutlet var lblOutput: UILabel!{
        didSet {
            lblOutput.textColor = UIColor.ThemeColor.labelColor
            lblOutput.backgroundColor = .clear
            lblOutput.font = UIFont.ThemeFont.titleFont
        }
    }
    @IBOutlet var lblMin: UILabel!{
        didSet {
            lblMin.textColor = UIColor.ThemeColor.labelColor
            lblMin.backgroundColor = .clear
            lblMin.font = UIFont.ThemeFont.subTitleFont
            lblMin.text = String(AppConstants.fizzBuzzMinValue)
        }
    }
    @IBOutlet var lblMax: UILabel!{
        didSet {
            lblMax.textColor = UIColor.ThemeColor.labelColor
            lblMax.backgroundColor = .clear
            lblMax.font = UIFont.ThemeFont.subTitleFont
            lblMax.text = String(AppConstants.fizzBuzzMaxValue)
        }
    }
    @IBOutlet var txtInput: UITextField!{
        didSet {
            txtInput.textColor = UIColor.ThemeColor.appThemeColor
            txtInput.placeholder = "Enter Number"
            txtInput.borderStyle = .roundedRect
        }
    }
    @IBOutlet var sliderInput: UISlider!{
        didSet {
            sliderInput.tintColor = UIColor.ThemeColor.appThemeColor
            sliderInput.minimumValue = Float(AppConstants.fizzBuzzMinValue)
            sliderInput.value = Float(AppConstants.fizzBuzzMinValue)
            sliderInput.maximumValue = Float(AppConstants.fizzBuzzMaxValue)
            sliderInput.isContinuous = false
        }
    }
    @IBOutlet var lblOutputValue: UILabel!{
        didSet {
            lblOutputValue.textColor = .white
            lblOutputValue.backgroundColor = UIColor.ThemeColor.appThemeColor
            lblOutputValue.font = UIFont.ThemeFont.resultFont
        }
    }
    
    var viewModel = FizzBuzzViewModel()
    let disposeBag = DisposeBag()
    
    // MARK: - Initial Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
        setupBinding()
    }
    
    private func initialSetUp() {
        view.backgroundColor = .white
        hideKeyboardWhenTappedAround()
        txtInput.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        txtInput.delegate = self
        txtInput.keyboardType = .numberPad
        self.title = "FizzBuzz Demo"
        let btnSettings = UIBarButtonItem(image: UIImage(named: "SettingsIcon")
            ,landscapeImagePhone: UIImage(named: "SettingsIcon")
            , style: .plain, target: self, action: #selector(settingsTapped))
        navigationItem.rightBarButtonItem = btnSettings
    }
    
    // MARK: - Actions/Events
    @objc func settingsTapped() {
        UIView.transition(with: (self.navigationController?.view)!, duration: 0.75, options: .transitionFlipFromRight, animations: {
            let configVC = FizzBuzzSettingsVC(nibName: "FizzBuzzSettingsVC", bundle: nil)
            configVC.viewModel.configurationDict = self.viewModel.fizzBuzzModel.configDict
            configVC.viewModel.configDictKeysArray = self.viewModel.fizzBuzzModel.configDict.keys.sorted()

            configVC
                .viewModel
                .fizzBuzzConfigObject
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: { (output) in
                    self.viewModel.updateFizzBuzzModel(output)
                    self.getResult()
                    print("notified dict output..\(output)")
                })
                .disposed(by: self.disposeBag)

            self.navigationController?.pushViewController(configVC, animated: false)
        })
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        sliderInput.value = Float(AppConstants.fizzBuzzMinValue)
        if let textInput = textField.text, let sliderValue = Float(textInput) {
            sliderInput.value = sliderValue
        }
        getResult()
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        txtInput.text = "\(Int(sender.value))"
        getResult()
    }
    
    // MARK: - Bindings
    private func setupBinding() {
        viewModel
            .fizzBuzzOutput
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (output) in
                self.setAndAnimateOutput(output)
            })
            .disposed(by: disposeBag)
    }
    
    private func getResult() {
        viewModel.fizzbuzz(number: Int(sliderInput.value))
    }
    
    private func setAndAnimateOutput(_ output: String) {
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.lblOutputValue.transform = .init(scaleX: 1.25, y: 1.25)
        }) { (finished: Bool) -> Void in
            self.lblOutputValue.text = output
            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                self.lblOutputValue.transform = .identity
            })
        }
    }

}

extension FizzBuzzVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        return Utility.isInputValid(newString)
    }
}
