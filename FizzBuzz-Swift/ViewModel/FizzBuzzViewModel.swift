//
//  FizzBuzzViewModel.swift
//  FizzBuzz-Swift
//
//  Created by Parth on 25/01/20.
//  Copyright © 2020 Parth. All rights reserved.
//

import RxSwift
import RxCocoa

class FizzBuzzViewModel {
        
    public let fizzBuzzOutput : PublishSubject<String> = PublishSubject()
    private var fizzBuzzModel = FizzBuzzConfigModel(configDict: AppConstants.defaultConfig)

    func updateFizzBuzzModel(_ model: FizzBuzzConfigModel){
        fizzBuzzModel = model
    }
    
    //Unit testable logic..
    @discardableResult
    func fizzbuzz(number: Int) -> String {
        if number == 0 {
            self.fizzBuzzOutput.onNext(String())
            return String()
        }
        
        let keysArray = Array(fizzBuzzModel.configDict.keys).sorted()
        var strOutput = String()
        for key in keysArray {
            if number.isMultiple(of: key) {
                if let strVal = fizzBuzzModel.configDict[key] {
                    strOutput.append(strVal)
                }
            }
        }
        if strOutput.isEmpty {
            strOutput = String(number)
        }
        self.fizzBuzzOutput.onNext(strOutput)
        return strOutput
    }
}

