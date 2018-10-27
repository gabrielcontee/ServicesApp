//
//  APIError.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 27/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

enum APIError: Error {
    case encoding
    case decoding
    case server(message: String)
}

