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
    }
    
    // MARK: - Actions/Events
    @objc func textFieldDidChange(textField: UITextField){
        sliderInput.value = Float(AppConstants.fizzBuzzMinValue)
        if let textInput = textField.text, let sliderValue = Float(textInput) {
            sliderInput.value = sliderValue
        }
        getResult()
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        txtInput.text = "\(Int((round(sender.value))))"
        getResult()
    }
    
    // MARK: - Bindings
    private func setupBinding() {
        viewModel
            .finalOutput
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (output) in
                self.lblOutputValue.text = output
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Bindings
    private func getResult() {
        viewModel.fizzbuzz(number: Int(sliderInput.value))
    }

}

extension FizzBuzzVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        return Utility.isInputValid(newString)
    }
    
}

