//
//  TasksPopulationTests.swift
//  ServicesAppTests
//
//  Created by Gabriel Conte on 27/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import XCTest

@testable import ServicesApp

class TasksPopulationTest: XCTestCase {
    
    var viewModel: TaskListViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = TaskListViewModel()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    
    func testTaskForIndex() {
        let expectation = self.expectation(description: "taskForIndex")
        
        viewModel.fetchAllTasks(completion: {
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 15, handler: nil)
        XCTAssertNotEqual(viewModel.task(for: 0), "")
        XCTAssertNotNil(viewModel.task(for: 0))
        XCTAssertNotEqual(viewModel.task(for: 0), viewModel.task(for: 1))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}




