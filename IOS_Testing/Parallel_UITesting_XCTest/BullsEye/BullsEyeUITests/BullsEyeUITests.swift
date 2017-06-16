//
//  BullsEyeUITests.swift
//  BullsEyeUITests
//
//  Created by Bhatt, Rushi on 6/14/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import BullsEye

class BullsEyeUITests: XCTestCase {
    
    var app:XCUIApplication!
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        //app.waitForExistence(timeout: 2)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGameStyleSwitch1() {
     
        //given
        let slideButton1 = app.segmentedControls.buttons["Slide"]
        let typeButton1 = app.segmentedControls.buttons["Type"]
        let slideLabel1 = app.staticTexts["Get as close as you can to: "]
        let typeLabel1 = app.staticTexts["Guess where the slider is: "]
        
        // then
        if slideButton1.isSelected {
            XCTAssertTrue(slideLabel1.exists)
            XCTAssertFalse(typeLabel1.exists)
            
            typeButton1.tap()
            XCTAssertTrue(typeLabel1.exists)
            XCTAssertFalse(slideLabel1.exists)
        } else if typeButton1.isSelected {
            XCTAssertTrue(typeLabel1.exists)
            XCTAssertFalse(slideLabel1.exists)
            
            slideButton1.tap()
            XCTAssertTrue(slideLabel1.exists)
            XCTAssertFalse(typeLabel1.exists)
        }
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
