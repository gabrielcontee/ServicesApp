//
//  TaskListViewModel.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 27/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

protocol TaskFetchDelegate {
    func loadData()
}

protocol ErrorAlertDelegate {
    func alertError(msg: String)
}

class TaskListViewModel: NSObject{
    
    private lazy var dataSource = TaskListDataSource()
    
    var fetchDelegate: TaskFetchDelegate?
    var errorDelegate: ErrorAlertDelegate?
    var tasks: [Task?] = []
    
    func numberOfTasks() -> Int{
        return tasks.count
    }
    
    func tasks(for index: Int) -> Task?{
        guard tasks.isEmpty == false else {
            return nil
        }
        return tasks[index]
    }
    
    func fetchAllTasks(completion:(()->())? = nil){
        dataSource.fetchTaskList { (error) in
            if error == nil{
                print("Finished fetching tasks!")
                self.tasks = self.dataSource.tasks
                self.fetchDelegate?.loadData()
                completion?()
            }else{
                self.errorDelegate?.alertError(msg: "Fetch failed, please try again")
            }
        }
    }
    
}

