//
//  Stepper.swift
//  benaStoreSwiftUI
//
//  Created by Minata on 22/08/2024.
//

import SwiftUI

struct Stepper: View {
    
    let product: Product
    @Environment(CartStore.self) private var cartStore
    
    var body: some View {
        HStack {
            Button {
                cartStore.removeFromCart(product: product)
            } label: {
                Image(systemName: "minus")
                    .foregroundStyle(.white)
                    .frame(width: 35, height: 35)
                    .background(.blue)
                    .clipShape(.circle)
            }
            .buttonStyle(.plain)
            
            Text(cartStore.quantity(for: product).description)
                .font(.title2)
                .padding(5)
            
            Button {
                cartStore.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .frame(width: 35, height: 35)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.circle)
            }
            .buttonStyle(.plain)
        }
        .frame(maxHeight: 44)
    }
}

#Preview {
    Stepper(product: Product.sample.first!)
        .environment(CartStore())
}
