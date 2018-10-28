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
    
    lazy var cityName: String = ""
    lazy var neighborhoodName: String = ""
    lazy var placeAddress: String = ""
    lazy var placeLatitude: Double = 0.0
    lazy var placeLongitude: Double = 0.0
    lazy var placePhone: String = ""
    lazy var placeTitle: String = ""
    lazy var placeDescription: String = ""
    
    private lazy var placePhotoString = ""
    var placePhotoURL: URL{
        return URL(string: placePhotoString)!
    }
    
    private lazy var placeLogoString = ""
    var placeLogoURL: URL{
        return URL(string: placeLogoString)!
    }
    
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
                self.cityName = placeInfo?.cidade ?? ""
                self.neighborhoodName = placeInfo?.bairro ?? ""
                self.neighborhoodName = placeInfo?.endereco ?? ""
                self.placePhone = placeInfo?.telefone ?? ""
                self.placeTitle = placeInfo?.titulo ?? ""
                self.placeDescription = placeInfo?.texto ?? ""
                self.placePhotoString = placeInfo?.urlFoto ?? ""
                self.placeLogoString = placeInfo?.urlLogo ?? ""
                if let latitude = placeInfo?.latitude, let longitude = placeInfo?.longitude{
                    self.placeLatitude = latitude
                    self.placeLongitude = longitude
                }
                completion()
            }else{
                print("Could not load place details")
                completion()
            }
            
        }
    }
    
}

