//
//  CommentariesViewModel.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 28/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

protocol DataRefresh{
    func loadData()
}

class CommentariesViewModel: NSObject {
    
    private lazy var detailsDataSource = PlacesDataSource()
    
    private lazy var commentaries: [Commentary] = []
    
    var refreshDelegate: DataRefresh?
    
    override init() {
        super.init()
        
        detailsDataSource.delegate = self
    }
    
    func comment(for index: Int) -> Commentary?{
        guard commentaries.isEmpty == false else {
            return nil
        }
        return commentaries[index]
    }
    
    func numberOfCommentaries() -> Int{
        return commentaries.count
    }
}

extension CommentariesViewModel: CommentDataDelegate{
    
    func commentariesReceived(commentaries: [Commentary]) {
        self.commentaries = commentaries
        self.refreshDelegate?.loadData()
    }
    
}
