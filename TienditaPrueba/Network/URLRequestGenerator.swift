//
//  URLRequestGenerator.swift
//  TienditaPrueba
//
//  Created by Gerardo Gordillo Hernandez on 27/02/23.
//

import Foundation

enum GenerateURLRequest {
    static func createURL(request: RequestData) -> URLRequest? {
        guard let url = URL(string: request.path) else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return urlRequest
    }
}
