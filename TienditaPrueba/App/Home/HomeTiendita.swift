//
//  HomeTiendita.swift
//  TienditaPrueba
//
//  Created by Gerardo Gordillo Hernandez on 01/03/23.
//

import SwiftUI

struct HomeTiendita: View {
    @StateObject private var viewModel = HomeViewModel()
    
    private var columns: [GridItem] = [
            GridItem(.adaptive(minimum: 160), spacing: 20)
        ]
    
    init() {
        UINavigationBar.appearance().scrollEdgeAppearance = HomeTiendita.navBarConfiguration
        UINavigationBar.appearance().standardAppearance = HomeTiendita.navBarConfiguration
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.products) { product in
                        HomeProductsCard(product: product, addFavorite: {
                            viewModel.addToFavorits(product: product)
                        })
                    }
                }
                .padding()
            }
            .navigationTitle("Fake Tiendita")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                CartButton()
            }
        }
        .onAppear() {
            viewModel.getProducts()
        }
    }
}

extension HomeTiendita {
    static let navBarConfiguration: UINavigationBarAppearance = {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor.blue
        navBarAppearance.titleTextAttributes = [.foregroundColor : UIColor.white]
        
        return navBarAppearance
    }()
    
}

struct HomeTiendita_Previews: PreviewProvider {
    static var previews: some View {
        HomeTiendita()
    }
}
