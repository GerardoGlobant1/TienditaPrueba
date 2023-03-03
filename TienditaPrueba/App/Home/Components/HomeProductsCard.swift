//
//  HomeProductsCard.swift
//  TienditaPrueba
//
//  Created by Gerardo Gordillo Hernandez on 02/03/23.
//

import SwiftUI

struct HomeProductsCard: View {
    var product: Product
    var addFavorite: () -> Void
    
    var body: some View {
        ZStack {
            ProductCardView(addFavorite: addFavorite, product: product)
        }
        .frame(width: 145, height: 190)
        .padding()
        .border(.black, width: 0.2)
        .cornerRadius(2)
        .shadow(radius: 2)
    }
}

struct HomeProductsCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeProductsCard(product: mockProducts[0], addFavorite: {})
    }
}
