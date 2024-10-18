//
//  AddToCartButton.swift
//  benaStoreSwiftUI
//
//  Created by Minata on 22/08/2024.
//

import SwiftUI

struct AddToCartButton: View {
    
    @Environment(CartStore.self) private var cartStore
    let product: Product
    
    var body: some View {
        if cartStore.quantity(for: product) > 0 {
            Stepper(product: product)
            
        } else {
            Button {
                cartStore.addToCart(product: product)
            } label: {
                Label{
                    Text("Add to Cart")
                        .font(.system(size: 13))
                } icon: {
                    Image(systemName: "cart")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .frame(maxWidth: .infinity, minHeight: 44)
                .font(.body)
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: 10))

            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    AddToCartButton(product: Product.sample.first!)
        .environment(CartStore())
}
