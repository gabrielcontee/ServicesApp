//
//  Commentary.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 28/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

struct Commentary: Decodable {
    
    let urlFoto: String
    let nome: String
    let nota: Int
    let titulo: String
    let comentario: String
    
    enum CodingKeys: String, CodingKey {
        case urlFoto
        case nome
        case nota
        case titulo
        case comentario
    }
}
