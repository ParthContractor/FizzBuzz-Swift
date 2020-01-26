//
//  FizzBuzzSettingsViewModel.swift
//  FizzBuzz-Swift
//
//  Created by Parth on 26/01/20.
//  Copyright © 2020 Parth. All rights reserved.
//

import RxSwift

class FizzBuzzSettingsViewModel {

    public let fizzBuzzConfigObject : PublishSubject<FizzBuzzConfigModel> = PublishSubject()

    var configurationDict = AppConstants.defaultConfig

    func updateConfigDict(_ key: Int, _ value: String){
        configurationDict.updateValue(value, forKey: key)
    }    
}
