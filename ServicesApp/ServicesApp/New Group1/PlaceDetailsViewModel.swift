//
//  PlaceDetailsViewModel.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 28/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

class PlaceDetailsViewModel: NSObject {
    
    private lazy var dataSource = PlacesDataSource()
    
    func fillDescriptionLabel(with string: String) -> String{
        if string != ""{
            return string
        }else{
            return "There is not an available description for this character until now :("
        }
    }
    

    func fetchPlaceData(placeIdString: String, completion: @escaping (Error?)->()){
        dataSource.fetchPlaceData(idString: placeIdString) { (error) in
            if error == nil{
//                print(self.dataSource.placeDict)
                completion(nil)
            }else{
                print("Could not load place details")
                completion(error)
            }
            
        }
    }
    
}

