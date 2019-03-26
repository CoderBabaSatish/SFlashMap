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
    
     var mapviewcntrl: ViewController!
     var app: XCUIApplication!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        XCUIDevice.shared.orientation = .portrait
       
        
        self.mapviewcntrl = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mapviewcntrl = nil
        super.tearDown()
    }
    
    //---test initial region-----
    func test_region_SFlashMap() {
      
        let _ = self.mapviewcntrl.view
        XCTAssertEqual(5000, mapviewcntrl.regionRadius)
    }
    
    
    //---test initial longitude and latitude
    func test_long_lat_SFlashMap() {
        
        let _ = self.mapviewcntrl.view
        XCTAssertEqual(13.391386, mapviewcntrl.initialLocation.longitude)
        XCTAssertEqual(52.523395, mapviewcntrl.initialLocation.latitude)
    }
    
   
    
     /**
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
    
    */
}
