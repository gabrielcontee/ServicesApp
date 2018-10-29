//
//  ServicesAppUITests.swift
//  ServicesAppUITests
//
//  Created by Gabriel Conte on 27/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import XCTest

class ServicesAppUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.otherElements.containing(.navigationBar, identifier:"Tasks").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element.swipeUp()
        app.collectionViews.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.tap()
        
        let portoAlegreCentroNavigationBar = app.navigationBars["Porto Alegre - Centro"]
        portoAlegreCentroNavigationBar.children(matching: .button).element(boundBy: 1).tap()
        
        let scrollViewsQuery = app.scrollViews
        let textView = scrollViewsQuery.children(matching: .other).element.children(matching: .other).element(boundBy: 2).children(matching: .textView).element
        textView.tap()
        
        let elementsQuery = scrollViewsQuery.otherElements
        let cellsQuery = elementsQuery.collectionViews.cells
        textView.swipeDown()
        elementsQuery/*@START_MENU_TOKEN@*/.otherElements["Club 688"]/*[[".maps.otherElements[\"Club 688\"]",".otherElements[\"Club 688\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        elementsQuery.buttons["SERVICOS"].tap()
        app.navigationBars["UIView"].buttons["Back"].tap()
        elementsQuery.buttons["ENDERECO POINT"].tap()
        app.alerts["Endereço"].buttons["OK"].tap()
        elementsQuery.buttons["COMENTARIOS"].tap()
        cellsQuery.otherElements.containing(.staticText, identifier:"Usuario aaa").children(matching: .textView).element.tap()
        elementsQuery.buttons["FAVORITOS copy"].tap()
        portoAlegreCentroNavigationBar.buttons["Tasks"].tap()
        
        
    }

}
