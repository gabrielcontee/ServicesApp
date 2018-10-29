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
    var tasks: Task?
    
    func numberOfTasks() -> Int{
        return tasks?.lista.count ?? 0
    }
    
    func task(for index: Int) -> String?{
        guard tasks?.lista.isEmpty == false else {
            return nil
        }
        return tasks?.lista[index]
    }
    
    func fetchAllTasks(completion:(()->())? = nil){
        dataSource.fetchTaskList { (error) in
            if error == nil{
                print("Finished fetching tasks!")
                self.tasks = self.dataSource.tasks ?? nil
                self.fetchDelegate?.loadData()
                completion?()
            }else{
                self.errorDelegate?.alertError(msg: "Fetch failed, please try again")
            }
        }
    }
    
}

