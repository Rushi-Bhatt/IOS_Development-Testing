//
//  BullsEyeUITests.swift
//  BullsEyeUITests
//
//  Created by Bhatt, Rushi on 6/14/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import BullsEye

class BullsEyeUITests2: XCTestCase {
    
    var app2:XCUIApplication!
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app2 = XCUIApplication()
        app2.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        //app2.waitForExistence(timeout: 2)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGameStyleSwitch2() {
        
        //given
        let slideButton2 = app2.segmentedControls.buttons["Slide"]
        let typeButton2 = app2.segmentedControls.buttons["Type"]
        let slideLabel2 = app2.staticTexts["Get as close as you can to: "]
        let typeLabel2 = app2.staticTexts["Guess where the slider is: "]
        
        // then
        if slideButton2.isSelected {
            XCTAssertTrue(slideLabel2.exists)
            XCTAssertFalse(typeLabel2.exists)
            
            typeButton2.tap()
            XCTAssertTrue(typeLabel2.exists)
            XCTAssertFalse(slideLabel2.exists)
        } else if typeButton2.isSelected {
            XCTAssertTrue(typeLabel2.exists)
            XCTAssertFalse(slideLabel2.exists)
            
            slideButton2.tap()
            XCTAssertTrue(slideLabel2.exists)
            XCTAssertFalse(typeLabel2.exists)
        }
        
     }
    
    func testFormSubmit2(){
       
        let countryElementsQuery = app2.otherElements.containing(.staticText, identifier:"Country:")
        let textField = countryElementsQuery.children(matching: .textField).element(boundBy: 0)
        textField.tap()
        textField.typeText("united kingdom")
        
        let returnButton = app2/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        
        
        let textField2 = countryElementsQuery.children(matching: .textField).element(boundBy: 1)
        textField2.tap()
        textField2.typeText("heema")
        returnButton.tap()
        
        
        let textField3 = countryElementsQuery.children(matching: .textField).element(boundBy: 2)
        textField3.tap()
        
        let moreKey = app2/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        textField3.typeText("9122122")
        returnButton.tap()
        
        app2.buttons["Submit"].tap()
        
        
    }
    
}

