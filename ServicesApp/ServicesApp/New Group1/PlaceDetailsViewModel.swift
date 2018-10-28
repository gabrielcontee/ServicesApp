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
    
    lazy var placeName: String = ""
    
    func fillDescriptionLabel(with string: String) -> String{
        if string != ""{
            return string
        }else{
            return "There is not an available description for this character until now :("
        }
    }
    

    func fetchPlaceData(placeIdString: String, completion: @escaping ()->()){
        dataSource.fetchPlaceData(idString: placeIdString) { (error) in
            if error == nil{
                let placeInfo = self.dataSource.placeData
                self.placeName = placeInfo?.cidade ?? ""
                
                completion()
            }else{
                print("Could not load place details")
                completion()
            }
            
        }
    }
    
}

