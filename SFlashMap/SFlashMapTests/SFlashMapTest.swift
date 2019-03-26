//
//  SFlashMapTest.swift
//  SFlashMapTests
//
//  Created by Satish on 3/26/19.
//  Copyright © 2019 Satish. All rights reserved.
//

import Foundation
import XCTest
@testable import SFlashMap

class SFlashMapTest: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = false
       // XCUIApplication.launch(<#T##XCUIApplication#>)
        XCUIDevice.shared.orientation = .portrait
        
       // ViewController.
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
