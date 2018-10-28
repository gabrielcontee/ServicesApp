//
//  PlacesPopulationTests.swift
//  ServicesAppTests
//
//  Created by Gabriel Conte on 28/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import XCTest

@testable import ServicesApp

class PlacesDataSourceTest: XCTestCase {
    
    var viewModel: PlaceDetailsViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = PlaceDetailsViewModel()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    
    func testHeroForIndex() {
        let expectation = self.expectation(description: "taskForId")
        
        let taskId = "ultimo"
        
        viewModel.fetchPlaceData(placeIdString: taskId, completion: {
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 15, handler: nil)
        XCTAssertNotEqual(viewModel.neighborhoodName, "")
        XCTAssertNotEqual(viewModel.cityName, "")
        XCTAssertNotEqual(viewModel.placeAddress, "")
        XCTAssertNotEqual(viewModel.placeLatitude, 0.0)
        XCTAssertNotEqual(viewModel.placeLongitude, 0.0)
        XCTAssertNotEqual(viewModel.placePhone, "")
        XCTAssertNotEqual(viewModel.placePhotoURL, nil)
        XCTAssertNotEqual(viewModel.placeLogoURL, nil)
        XCTAssertNotEqual(viewModel.placeDescription, "")
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}



