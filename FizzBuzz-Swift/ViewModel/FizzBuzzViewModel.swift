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
        
    public let finalOutput : PublishSubject<String> = PublishSubject()

    private let disposable = DisposeBag()

    func fizzbuzz(number: Int) -> Void {
        if number == 0 {
            self.finalOutput.onNext(String())
            return
        }
        switch (number.isMultiple(of: 3), number.isMultiple(of: 5), number.isMultiple(of: 7)) {
        case (true, false, false):
            self.finalOutput.onNext(String("Fizzy"))
        case (false, true, false):
            self.finalOutput.onNext(String("Buzzy"))
        case (false, false, true):
            self.finalOutput.onNext(String("Foo"))
        case (true, true, false):
            self.finalOutput.onNext(String("FizzyBuzzy"))
        case (true, false, true):
            self.finalOutput.onNext(String("FizzyFoo"))
        case (false, true, true):
            self.finalOutput.onNext(String("BuzzyFoo"))
        case (true, true, true):
            self.finalOutput.onNext(String("FizzyBuzzyFoo"))
        case (false, false, false):
            self.finalOutput.onNext(String(number))
        }
    }
}

