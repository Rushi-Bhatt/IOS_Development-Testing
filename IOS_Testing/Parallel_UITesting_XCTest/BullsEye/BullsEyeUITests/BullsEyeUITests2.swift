//
//  BullsEyeUITests.swift
//  BullsEyeUITests
//
//  Created by Bhatt, Rushi on 6/14/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest

class BullsEyeUITests2: XCTestCase {
    
    var app1:XCUIApplication!
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app1 = XCUIApplication()
        app1.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGameSlider() {
        
//        app1.segmentedControls.buttons["Slide"].tap()
//        app1.sliders["49%"].swipeRight()
//        app1.buttons["hit me!"].tap()
        
        //given
        let slideButton = app1.segmentedControls.buttons["Slide"]
        let typeButton = app1.segmentedControls.buttons["Type"]
        let slideLabel = app1.staticTexts["Get as close as you can to: "]
        let typeLabel = app1.staticTexts["Guess where the slider is: "]
        
        // then
        if slideButton.isSelected {
            XCTAssertTrue(slideLabel.exists)
            XCTAssertFalse(typeLabel.exists)
            
            typeButton.tap()
            XCTAssertTrue(typeLabel.exists)
            XCTAssertFalse(slideLabel.exists)
        } else if typeButton.isSelected {
            XCTAssertTrue(typeLabel.exists)
            XCTAssertFalse(slideLabel.exists)
            
            slideButton.tap()
            XCTAssertTrue(slideLabel.exists)
            XCTAssertFalse(typeLabel.exists)
        }
        

        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
