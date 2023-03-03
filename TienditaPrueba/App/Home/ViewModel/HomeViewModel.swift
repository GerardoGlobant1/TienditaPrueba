//
//  HomeViewModel.swift
//  TienditaPrueba
//
//  Created by Gerardo Gordillo Hernandez on 02/03/23.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var products: [Product] = []
    let apiManager: GetAllProductsAPIManager = GetAllProductsAPI()
    
    func getProducts() {
        
        apiManager.getAllProducts { result in
            switch result {
            case .success(let productsResults):
                DispatchQueue.main.async { [weak self] in
                    self?.products = productsResults
                }
            case .failure(let error):
                break
            }
        }
    }
    
    func addToFavorits(product: Product) {
        print(product)
    }
}

let mockProducts = [ Product(id: 1,
                                    title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                                    price: 109.95,
                                    description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                                    category: "men's clothing",
                                    image: "playera1",
                                    rating: Rating(rate: 3.9, count: 120)),
                            Product(id: 2,
                                    title: "Mens Casual Premium Slim Fit T-Shirts ",
                                    price: 22.3,
                                    description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing.",
                                    category: "men's clothing",
                                    image: "playera1",
                                    rating: Rating(rate: 4.1, count: 259)),
                            Product(id: 3,
                                    title: "Mens Casual Premium Slim Fit T-Shirts ",
                                    price: 22.3,
                                    description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing.",
                                    category: "men's clothing",
                                    image: "playera1",
                                    rating: Rating(rate: 4.1, count: 259)),
                            Product(id: 4,
                                    title: "Mens Casual Premium Slim Fit T-Shirts ",
                                    price: 22.3,
                                    description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing.",
                                    category: "men's clothing",
                                    image: "playera1",
                                    rating: Rating(rate: 4.1, count: 259)),
                            Product(id: 5,
                                    title: "Mens Casual Premium Slim Fit T-Shirts ",
                                    price: 22.3,
                                    description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing.",
                                    category: "men's clothing",
                                    image: "playera1",
                                    rating: Rating(rate: 4.1, count: 259)),
                            Product(id: 6,
                                    title: "Mens Casual Premium Slim Fit T-Shirts ",
                                    price: 22.3,
                                    description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing.",
                                    category: "men's clothing",
                                    image: "playera1",
                                    rating: Rating(rate: 4.1, count: 259)),
                            Product(id: 7,
                                    title: "Mens Casual Premium Slim Fit T-Shirts ",
                                    price: 22.3,
                                    description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing.",
                                    category: "men's clothing",
                                    image: "playera1",
                                    rating: Rating(rate: 4.1, count: 259)),
                            
]
