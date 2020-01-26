//
//  UIViewController+Extension.swift
//  FizzBuzz-Swift
//
//  Created by Parth on 25/01/20.
//  Copyright © 2020 Parth. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlertWithKeyPairTextFields(title: String, message: String? = nil, key: String = "", value: String = "", callback: @escaping (_ intKey: Int, _ value: String) -> ()) {//(intKey, value)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.textColor = UIColor.ThemeColor.appThemeColor
            textField.borderStyle = .roundedRect
            textField.keyboardType = .numberPad
            textField.placeholder = "Enter key"
            textField.text = key
        })
        
        alert.addTextField(configurationHandler: { textField in
            textField.textColor = UIColor.ThemeColor.appThemeColor
            textField.borderStyle = .roundedRect
            textField.keyboardType = .default
            textField.placeholder = "Enter value"
            textField.text = value
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            if let key = alert.textFields?.first?.text, let value = alert.textFields?[1].text, let intKey = Int(key), intKey <= AppConstants.fizzBuzzMaxValue {
                callback(intKey, value)
            }
        }))
                
        present(alert, animated: true)
    }

}
