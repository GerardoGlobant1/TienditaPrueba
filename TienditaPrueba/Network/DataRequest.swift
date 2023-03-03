//
//  DataRequest.swift
//  TienditaPrueba
//
//  Created by Gerardo Gordillo Hernandez on 27/02/23.
//

import Foundation

struct RequestData {
    let path: String
    let method: HTTPMethod
    let params: [String: Any]?
    
    init(path: String, method: HTTPMethod = .get, params: [String : Any]? = nil) {
        self.path = path
        self.method = method
        self.params = params
    }
}

protocol RequestType {
    associatedtype ResponseType: Decodable
    var data: RequestData { get }
}

extension RequestType {
    func execute(dispatcher: NetworkDispatcher = URLSessionNetworkDispatcher(), response: @escaping(Result<ResponseType, Error>) -> Void) {
        dispatcher.dispatch(request: self.data) { result in
            switch result {
            case .success(let responseData):
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let jsonResult = try jsonDecoder.decode(ResponseType.self, from: responseData)
                    
                    response(.success(jsonResult))
                } catch let error {
                    response(.failure(error))
                }
            case .failure(let error):
                response(.failure(error))
            }
        }
    }
}
