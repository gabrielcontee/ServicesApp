//
//  APIResponse.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 27/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

struct APIResponse<Response: Decodable>: Decodable {
    /// Whether it was ok or not
    let status: String?
    /// Message that usually gives more information about some error
    let message: String?
    /// Requested data
    let data: ResponseContainer<Response>?
}
