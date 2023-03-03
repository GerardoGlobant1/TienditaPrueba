//
//  GetAllProductsRequest.swift
//  TienditaPrueba
//
//  Created by Gerardo Gordillo Hernandez on 01/03/23.
//

import Foundation

struct GetAllProductsRequest: RequestType {
    typealias ResponseType = [Product]
    
    private let getAllProductsRequest: Endpoint
    var data: RequestData {
        return RequestData(path: getAllProductsRequest.path)
    }
    
    init(getAllProductsRequest: Endpoint) {
        self.getAllProductsRequest = getAllProductsRequest
    }
}
