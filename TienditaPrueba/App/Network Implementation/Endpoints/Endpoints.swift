//
//  Endpoints.swift
//  TienditaPrueba
//
//  Created by Gerardo Gordillo Hernandez on 01/03/23.
//

import Foundation

protocol Endpoint {
    var path: String { get }
}

enum ProductsEndpoint: Endpoint {
    case getAllProducts
    case getImage(url: String)
}

extension ProductsEndpoint {
    var path: String {
        switch self {
        case .getAllProducts:
            return .makeForEndpoint("/products")
        case .getImage(let url):
            return .makeForEndpoint("/img\(url)")
        }
    }
}
