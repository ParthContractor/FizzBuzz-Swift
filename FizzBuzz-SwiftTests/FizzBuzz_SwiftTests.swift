//
//  FizzBuzz_SwiftTests.swift
//  FizzBuzz-SwiftTests
//
//  Created by Parth on 25/01/20.
//  Copyright © 2020 Parth. All rights reserved.
//

import XCTest
@testable import FizzBuzz_Swift

class FizzBuzz_SwiftTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFizzBuzzViewModel() {
        let viewModel = FizzBuzzViewModel()
        let dict = [3 : "Fizzy", 5 : "Buzzy", 7 : "Foo"]
        let fizzBuzzConfigModel = FizzBuzzConfigModel(configDict: dict)
        viewModel.updateFizzBuzzModel(fizzBuzzConfigModel)
        
        var output = viewModel.fizzbuzz(number: 3)
        XCTAssertEqual(output, "Fizzy")
        output = viewModel.fizzbuzz(number: 5)
        XCTAssertEqual(output, "Buzzy")
        output = viewModel.fizzbuzz(number: 7)
        XCTAssertEqual(output, "Foo")
        output = viewModel.fizzbuzz(number: 15)
        XCTAssertEqual(output, "FizzyBuzzy")
        output = viewModel.fizzbuzz(number: 21)
        XCTAssertEqual(output, "FizzyFoo")
        output = viewModel.fizzbuzz(number: 35)
        XCTAssertEqual(output, "BuzzyFoo")
        output = viewModel.fizzbuzz(number: 105)
        XCTAssertEqual(output, "FizzyBuzzyFoo")
        output = viewModel.fizzbuzz(number: 2)
        XCTAssertEqual(output, "2")
        output = viewModel.fizzbuzz(number: 4)
        XCTAssertEqual(output, "4")
        output = viewModel.fizzbuzz(number: 0)
        XCTAssertEqual(output, String())
    }
    
    func testFizzBuzzSettingsViewModel() {
        let viewModel = FizzBuzzSettingsViewModel()
        viewModel.updateConfigDict(11, "BooZoo")
        XCTAssertNotNil(viewModel.configurationDict[11])
        viewModel.updateConfigDict(11, "BooZooBoo")
        XCTAssertNotNil(viewModel.configurationDict[11])
        guard let valueFor11 = viewModel.configurationDict[11] else {
            XCTFail("Expected non-nil user and address")
            return
        }
        XCTAssertEqual(valueFor11, "BooZooBoo")
    }

    func testUtility() {
        XCTAssertEqual(Utility.isInputValid("ddd"), false)
        XCTAssertEqual(Utility.isInputValid("101"), true)
        XCTAssertEqual(Utility.isInputValid(""), true)
       }
}
