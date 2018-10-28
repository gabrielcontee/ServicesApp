//
//  PlacesDataSource.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 27/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

class PlacesDataSource: NSObject{
    
    typealias Id = Int
    
    private lazy var apiClient = ClientAPI()
    
//    lazy var placeData: [Id: Place] = [:]
    
    // Sends a fetch request for the place by id from API
    func fetchPlaceData(idString: String, completion: @escaping (Error?)->()){
        apiClient.send(GetPlace(idString: idString)) { (result) in
            switch result{
            case .success(let places):
//                self.placeData = places.results
                completion(nil)
            case .failure(let error):
                print(error)
                completion(error)
            }
        }
    }
}
