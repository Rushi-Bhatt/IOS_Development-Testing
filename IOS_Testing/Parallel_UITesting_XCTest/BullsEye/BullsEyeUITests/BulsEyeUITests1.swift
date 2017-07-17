//
//  BulsEyeUITests1.swift
//  BullsEyeUITests
//
//  Created by Bhatt, Rushi on 6/20/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest

class BulsEyeUITests1: XCTestCase {
        
    var app1:XCUIApplication!
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app1 = XCUIApplication()
        app1.launchArguments += ["-AppleLanguages", "(fr)"]
        app1.launchArguments += ["-AppleLocale", "\"fr-FR\""]
        app1.launchArguments += ProcessInfo().arguments
        app1.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        //app.waitForExistence(timeout: 2)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFormSubmit1(){
        
        let countryElementsQuery = app1.otherElements.containing(.staticText, identifier:"Country:")
        let textField = countryElementsQuery.children(matching: .textField).element(boundBy: 0)
        textField.tap()
        textField.typeText("United states")
        
        let returnButton = app1.buttons["Return"]
        returnButton.tap()
        
        
        let textField2 = countryElementsQuery.children(matching: .textField).element(boundBy: 1)
        textField2.tap()
        textField2.typeText("Rushi")
        returnButton.tap()
        
        
        let textField3 = countryElementsQuery.children(matching: .textField).element(boundBy: 2)
        textField3.tap()
        
        let moreKey = app1/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        textField3.typeText("9842029888")
        returnButton.tap()
        
        app1.buttons["Submit"].tap()
    }
    
    
}
