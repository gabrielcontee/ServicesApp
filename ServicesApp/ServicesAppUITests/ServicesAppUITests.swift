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
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.swipeUp()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.tap()
        
        let scrollViewsQuery = app.scrollViews
        let element3 = scrollViewsQuery.children(matching: .other).element
        let element = element3.children(matching: .other).element(boundBy: 2)
        element.children(matching: .textView).element.swipeUp()
        
        let elementsQuery = scrollViewsQuery.otherElements
        elementsQuery/*@START_MENU_TOKEN@*/.maps.containing(.other, identifier:"Bamboo Sushi House").element/*[[".maps.containing(.other, identifier:\"Pampa Burger\").element",".maps.containing(.other, identifier:\"Verbo Juridico\").element",".maps.containing(.other, identifier:\"Zaffari Ipiranga\").element",".maps.containing(.other, identifier:\"Bamboo Sushi House\").element"],[[[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        elementsQuery.buttons["SERVICOS"].tap()
        app.navigationBars["UIView"].buttons["Back"].tap()
        elementsQuery.buttons["ENDERECO POINT"].tap()
        app.alerts["Endereço"].buttons["OK"].tap()
        elementsQuery.buttons["FAVORITOS copy"].tap()
        element3.tap()
        
        let portoAlegrePetrPolisNavigationBar = app.navigationBars["Porto Alegre - Petrópolis"]
        portoAlegrePetrPolisNavigationBar.children(matching: .button).element(boundBy: 1).tap()
        elementsQuery.buttons["COMENTARIOS"].tap()
        element.children(matching: .other).element(boundBy: 5).children(matching: .other).element.children(matching: .collectionView).element.tap()
        elementsQuery.staticTexts["Ligar"].tap()
        elementsQuery.buttons["LIGAR copy"].tap()
        app.alerts["‭(51) 2222-2222‬"].buttons["Cancel"].tap()
        portoAlegrePetrPolisNavigationBar.buttons["Tasks"].tap()
        
        let element2 = collectionViewsQuery.children(matching: .cell).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element
        element2.swipeUp()
        element2.tap()
        
    }

}
