//
//  NetworkDispatcher.swift
//  TienditaPrueba
//
//  Created by Gerardo Gordillo Hernandez on 27/02/23.
//

import Foundation

enum NetworkDispatcherError: Error {
    case invalidURL
    case noData
    case unknowError
}

protocol NetworkDispatcher {
    func dispatch(request: RequestData, response: @escaping(Result<Data, Error>)-> Void)
}

struct URLSessionNetworkDispatcher: NetworkDispatcher {
    func dispatch(request: RequestData, response: @escaping (Result<Data, Error>) -> Void) {
        guard let urlRequest = GenerateURLRequest.createURL(request: request) else {
            response(.failure(NetworkDispatcherError.invalidURL))
            return
        }
        
        URLSession(configuration: .default).dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                response(.failure(error))
                return
            }
            guard let dataResponse = data else {
                response(.failure(NetworkDispatcherError.noData))
                return
            }
            response(.success(dataResponse))
        }.resume()
    }
}

extension NetworkDispatcherError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL path 🚧", comment: "")
        case .noData:
            return NSLocalizedString("There is no data 💾", comment: "")
        case .unknowError:
            return NSLocalizedString("Something is wrong 🚨", comment: "")
        }
    }
}
