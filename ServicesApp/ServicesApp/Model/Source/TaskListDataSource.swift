//
//  TaskListDataSource.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 27/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

class TaskListDataSource: NSObject {
    
    typealias Id = Int
    
    private lazy var apiClient = ClientAPI()
    
    var tasks: Task?
    
    // Sends a fetch request for the list of tasks from API
    func fetchTaskList(completion: @escaping (Error?)->()){
        
        apiClient.send(GetList()) { (result) in
            switch result{
            case .success(let tasks):
                self.tasks = tasks
                completion(nil)
            case .failure(let error):
                print(error)
                completion(error)
            }
        }
    }
    
}

