//
//  GetList.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 27/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

struct GetList: APIRequest {
    
    typealias Response = Task
    
    // Notice how we create a composed resourceName
    var resourceName: String {
        return "/tarefa"
    }
    
    init() {
    }
}
