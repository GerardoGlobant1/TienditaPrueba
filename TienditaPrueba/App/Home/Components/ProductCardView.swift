//
//  ProductCardView.swift
//  TienditaPrueba
//
//  Created by Gerardo Gordillo Hernandez on 02/03/23.
//

import SwiftUI

struct ProductCardView: View {
    var addFavorite: () -> Void
    var product: Product
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(alignment: .top, spacing: 15) {
                VStack(alignment: .center, spacing: 30) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .foregroundColor(.gray)
                    }
                    Button(action: {}) {
                        Image(systemName: "minus")
                            .foregroundColor(.gray)
                    }
                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.gray)
                    }
                }
                AsyncImage(url: URL(string: product.image)) { phase in
                    switch phase {
                    case .empty:
                        Image(systemName: "Photo")
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 90, maxHeight: 130)
                    case .failure:
                        Image(systemName: "Photo")
                    @unknown default:
                        Image(systemName: "photo")
                    }
                }
                Button(action: addFavorite) {
                    Image(systemName: "heart")
                        .foregroundColor(.gray)
                        .bold()
                }
            }
            .frame(width: 180)
            Text(product.title)
                .lineLimit(2)
                .frame(width: 180)
            HStack(spacing: 30) {
                Text("$\(product.price)")
                Label {
                    Text("\(product.rating.rate)")
                } icon: {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            .frame(width: 180)
        }
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(addFavorite: {}, product: mockProducts[0])
    }
}
