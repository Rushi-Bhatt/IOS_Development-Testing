//
//  BullsEyeUITests21.swift
//  BullsEyeUITests2
//
//  Created by Bhatt, Rushi on 6/20/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import XCTest

class BullsEyeUITests21: XCTestCase {
        
    var app21:XCUIApplication!
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app21 = XCUIApplication()
        app21.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        //app2.waitForExistence(timeout: 2)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testFormSubmit21(){
        
        let countryElementsQuery = app21.otherElements.containing(.staticText, identifier:"Country:")
        let textField = countryElementsQuery.children(matching: .textField).element(boundBy: 0)
        textField.tap()
        textField.typeText("China")
        
        let returnButton = app21/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        
        
        let textField2 = countryElementsQuery.children(matching: .textField).element(boundBy: 1)
        textField2.tap()
        textField2.typeText("Li Shi")
        returnButton.tap()
        
        
        let textField3 = countryElementsQuery.children(matching: .textField).element(boundBy: 2)
        textField3.tap()
        
        let moreKey = app21/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        textField3.typeText("12322111")
        returnButton.tap()
        
        app21.buttons["Submit"].tap()
    }
    
}
