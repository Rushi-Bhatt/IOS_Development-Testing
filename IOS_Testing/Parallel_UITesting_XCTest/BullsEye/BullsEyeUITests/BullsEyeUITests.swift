//
//  BullsEyeUITests.swift
//  BullsEyeUITests
//
//  Created by Bhatt, Rushi on 6/14/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest


class BullsEyeUITests: XCTestCase {
    
    var app:XCUIApplication!
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launchArguments += ["-AppleLanguages", "(fr)"]
        app.launchArguments += ["-AppleLocale", "\"fr-FR\""]
        app.launchArguments += ProcessInfo().arguments
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        //app.waitForExistence(timeout: 2)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGameStyleSwitch() {
     
        //given
        let slideButton = app.segmentedControls.buttons["Slide"]
        let typeButton = app.segmentedControls.buttons["Type"]
        let slideLabel = app.staticTexts["Get as close as you can to: "]
        let typeLabel = app.staticTexts["Guess where the slider is: "]
        
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
    
    func testFormSubmit(){
        let countryElementsQuery = app.otherElements.containing(.staticText, identifier:"Country:")
        let textField = countryElementsQuery.children(matching: .textField).element(boundBy: 0)
        textField.tap()
        textField.typeText("India")
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        
        let textField2 = countryElementsQuery.children(matching: .textField).element(boundBy: 1)
        textField2.tap()
        textField2.typeText("Kiran")
        returnButton.tap()
        
        
        let textField3 = countryElementsQuery.children(matching: .textField).element(boundBy: 2)
        textField3.tap()
        
        let moreKey = app.keys["more"]
        moreKey.tap()
        textField3.typeText("9725025306")
        returnButton.tap()
        
        app.buttons["Submit"].tap()
    
    }
    
}
