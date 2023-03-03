//
//  GetAllProductsAPIManager.swift
//  TienditaPrueba
//
//  Created by Gerardo Gordillo Hernandez on 03/03/23.
//

import Foundation

protocol GetAllProductsAPIManager {
    func getAllProducts(completionResult: @escaping (Result<[Product], Error>) -> Void)
}

struct GetAllProductsAPI: GetAllProductsAPIManager {
    func getAllProducts(completionResult: @escaping (Result<[Product], Error>) -> Void) {
        let endpoint: ProductsEndpoint = .getAllProducts
        let request = GetAllProductsRequest(getAllProductsRequest: endpoint)
        DispatchQueue.global(qos: .userInitiated).async {
            request.execute { result in
                switch result {
                case .success(let productsResponse):
                    completionResult(.success(productsResponse))
                case .failure(let error):
                    completionResult(.failure(error))
                }
            }
        }
    }
}
