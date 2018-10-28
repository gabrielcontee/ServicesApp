//
//  Place.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 27/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

struct Place: Decodable{
    
    let id: String?
    let cidade: String?
    let bairro: String?
    let urlFoto: String?
    let urlLogo: String?
    let titulo: String?
    let telefone: String?
    let texto: String?
    let endereco: String?
    let latitude: Double?
    let longitude: Double?
}
