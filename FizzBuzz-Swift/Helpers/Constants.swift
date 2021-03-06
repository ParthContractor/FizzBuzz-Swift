//
//  Constants.swift
//  FizzBuzz-Swift
//
//  Created by Parth on 25/01/20.
//  Copyright © 2020 Parth. All rights reserved.
//

import UIKit

struct AppConstants {
    //predefined range between which user input is restricted..
    static let fizzBuzzMinValue = 0
    static let fizzBuzzMaxValue = 10000
    
    //For now no offline storage(persistence) implemented..
    //By default on every app launch this configuration will be considered and can be changed by user..
    static let defaultConfig = [3 : "Fizzy", 5 : "Buzzy", 7 : "Foo", 9 : "Bar"]
}

extension UIFont {
    struct ThemeFont {
        static let titleFont = UIFont.systemFont(ofSize: 17)
        static let subTitleFont = UIFont.systemFont(ofSize: 10)
        static let resultFont = UIFont.systemFont(ofSize: 28)
    }
}
extension UIColor {
    struct ThemeColor {
        static let labelColor = UIColor.black
        static let appThemeColor = UIColor.orange
    }
}

