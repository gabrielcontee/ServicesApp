//
//  TasksDataSourceTest.swift
//  ServicesAppTests
//
//  Created by Gabriel Conte on 28/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import XCTest

@testable import ServicesApp

class TasksDataSourceTest: XCTestCase {
    
    var dataSource: TaskListDataSource!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataSource = TaskListDataSource()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        dataSource = nil
    }
    
    
    func testTasksFetch() {
        
        let expectation = self.expectation(description: "tasksResult")
        
        var errorFound: Bool = false
        
        dataSource.fetchTaskList(completion: { (error) in
            if error != nil{
                errorFound = true
            }
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 20, handler: nil)
        
        if errorFound{
            fatalError("Could not fetch tasks")
        } else{
            XCTAssertNotEqual(self.dataSource.tasks?.lista.count, 0)
            XCTAssertNotNil(self.dataSource.tasks?.lista)
            XCTAssertNotEqual(self.dataSource.tasks?.lista[0], "")
            XCTAssertNotNil(self.dataSource.tasks?.lista.first)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}



