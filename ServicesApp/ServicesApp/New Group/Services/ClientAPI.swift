//
//  APIRequest.swift
//  ServicesApp
//
//  Created by Gabriel Conte on 27/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

class ClientAPI {
    
    private let baseEndpointUrl = "http://dev.4all.com:3003"
    private let session = URLSession(configuration: .default)
    
    /// Sends a request to Marvel servers, calling the completion method when finished
    func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<ResponseContainer<T.Response>>) {
        
        let endpoint = URL(string: baseEndpointUrl + request.resourceName)!
        
        let task = session.dataTask(with: URLRequest(url: endpoint)) { data, response, error in
            if let data = data {
                do {
                    // Decode the top level response, and look up the decoded response to see
                    // if it's a success or a failure
                    let response = try JSONDecoder().decode(APIResponse<T.Response>.self, from: data)
                    
                    if let responseContainer = response.data {
                        completion(.success(responseContainer))
                    } else if let message = response.message {
                        completion(.failure(APIError.server(message: message)))
                    } else {
                        completion(.failure(APIError.decoding))
                    }
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}


