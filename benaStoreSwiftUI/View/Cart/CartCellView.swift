//
//  CartCellView.swift
//  benaStoreSwiftUI
//
//  Created by Minata on 22/08/2024.
//

import SwiftUI

struct CartCellView: View {
    
    let cartItem: CartItem
    @Environment(CartStore.self) private var cartStore
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: cartItem.product.imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 90)
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }
                
                VStack(alignment: .leading) {
                    Text(cartItem.product.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .lineLimit(3)
                        .minimumScaleFactor(0.5)
                    Text("$" + cartItem.product.price.description)
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
            
            ZStack {
                Group {
                    Text("Quantity: ")
                        .font(.title3)
                        .fontWeight(.semibold)
                    +
                    Text(cartItem.quantity.description)
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                HStack {
                    Spacer()
                    Button {
                        cartStore.removeFromCart(product: cartItem.product)
                    } label: {
                        Image(systemName: "trash.fill")
                            .foregroundColor(.red)
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    CartCellView(cartItem: CartItem(product: Product.sample.first!, quantity: 2))
        .environment(CartStore(cartItems: CartItem.sample, apiClient: .testSuccess))
}
