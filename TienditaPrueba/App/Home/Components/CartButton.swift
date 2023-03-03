//
//  CartButton.swift
//  TienditaPrueba
//
//  Created by Gerardo Gordillo Hernandez on 02/03/23.
//

import SwiftUI

struct CartButton: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.top, 5)
                .foregroundColor(.white)
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton()
    }
}
