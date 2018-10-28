//
//  PlacesDataSource.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 27/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

protocol CommentDataDelegate{
    func commentariesReceived(commentaries: [Commentary])
}

class PlacesDataSource: NSObject{
    
    typealias Id = Int
    
    private lazy var apiClient = ClientAPI()
    
    var delegate: CommentDataDelegate?
    
    var placeData: Place?
    
    // Sends a fetch request for the place by id from API
    func fetchPlaceData(idString: String, completion: @escaping (Error?)->()){
        apiClient.send(GetPlace(idString: idString)) { (result) in
            switch result{
            case .success(let place):
                self.placeData = place
                
                self.delegate?.commentariesReceived(commentaries: place.comentarios ?? [])
                
                completion(nil)
            case .failure(let error):
                print(error)
                completion(error)
            }
        }
    }
}
