//
//  BullsEyeUITests3.swift
//  BullsEyeUITests3
//
//  Created by Bhatt, Rushi on 6/20/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import BullsEye

class BullsEyeUITests3: XCTestCase {
    var app3:XCUIApplication!
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app3 = XCUIApplication()
        app3.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStyle() {
        //given
        let slideButton2 = app3.segmentedControls.buttons["Slide"]
        let typeButton2 = app3.segmentedControls.buttons["Type"]
        let slideLabel2 = app3.staticTexts["Get as close as you can to: "]
        let typeLabel2 = app3.staticTexts["Guess where the slider is: "]
        
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
    func testUS(){
        let countryElementsQuery = app3.otherElements.containing(.staticText, identifier:"Country:")
        let textField = countryElementsQuery.children(matching: .textField).element(boundBy: 0)
        textField.tap()
        textField.typeText("united states")
        
        let returnButton = app3/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        
        
        let textField2 = countryElementsQuery.children(matching: .textField).element(boundBy: 1)
        textField2.tap()
        textField2.typeText("Rushi")
        returnButton.tap()
        
        
        let textField3 = countryElementsQuery.children(matching: .textField).element(boundBy: 2)
        textField3.tap()
        
        let moreKey = app3/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        textField3.typeText("9842029667")
        returnButton.tap()
        
        app3.buttons["Submit"].tap()
    }
    func testUK(){
        let countryElementsQuery = app3.otherElements.containing(.staticText, identifier:"Country:")
        let textField = countryElementsQuery.children(matching: .textField).element(boundBy: 0)
        textField.tap()
        textField.typeText("United kingdom")
        
        let returnButton = app3/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        
        
        let textField2 = countryElementsQuery.children(matching: .textField).element(boundBy: 1)
        textField2.tap()
        textField2.typeText("Heema")
        returnButton.tap()
        
        
        let textField3 = countryElementsQuery.children(matching: .textField).element(boundBy: 2)
        textField3.tap()
        
        let moreKey = app3/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        textField3.typeText("124777333")
        returnButton.tap()
        
        app3.buttons["Submit"].tap()
        
    }
    func testChina(){
        let countryElementsQuery = app3.otherElements.containing(.staticText, identifier:"Country:")
        let textField = countryElementsQuery.children(matching: .textField).element(boundBy: 0)
        textField.tap()
        textField.typeText("China")
        
        let returnButton = app3/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        
        
        let textField2 = countryElementsQuery.children(matching: .textField).element(boundBy: 1)
        textField2.tap()
        textField2.typeText("Li Shi")
        returnButton.tap()
        
        
        let textField3 = countryElementsQuery.children(matching: .textField).element(boundBy: 2)
        textField3.tap()
        
        let moreKey = app3/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        textField3.typeText("12322111")
        returnButton.tap()
        
        app3.buttons["Submit"].tap()
        
    }
    func testIndia(){
        let countryElementsQuery = app3.otherElements.containing(.staticText, identifier:"Country:")
        let textField = countryElementsQuery.children(matching: .textField).element(boundBy: 0)
        textField.tap()
        textField.typeText("India")
        
        let returnButton = app3/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        
        
        let textField2 = countryElementsQuery.children(matching: .textField).element(boundBy: 1)
        textField2.tap()
        textField2.typeText("Kiran")
        returnButton.tap()
        
        
        let textField3 = countryElementsQuery.children(matching: .textField).element(boundBy: 2)
        textField3.tap()
        
        let moreKey = app3/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        textField3.typeText("9725025306")
        returnButton.tap()
        
        app3.buttons["Submit"].tap()
    }
}
