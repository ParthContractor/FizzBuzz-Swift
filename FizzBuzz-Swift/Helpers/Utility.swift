//
//  Utility.swift
//  FizzBuzz-Swift
//
//  Created by Parth on 25/01/20.
//  Copyright © 2020 Parth. All rights reserved.
//

import Foundation

struct Utility {
    
    //To validate input(restrict user to enter value between defined range)..
    static func isInputValid(_ strInput: String) -> Bool {
        if let number = Int(strInput) {
            if number <= AppConstants.fizzBuzzMaxValue {
                return true
            }
        }
        else if strInput.isEmpty {
            return true
        }
        return false
    }
}
