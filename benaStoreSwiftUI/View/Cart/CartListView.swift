//
//  CartListView.swift
//  benaStoreSwiftUI
//
//  Created by Minata on 22/08/2024.
//

import SwiftUI

struct CartListView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(CartStore.self) private var cartStore
    
    var body: some View {
        ZStack {
            NavigationStack {
                Group {
                    if cartStore.cartItems.isEmpty {
                        VStack {
                            Image(systemName: "takeoutbag.and.cup.and.straw")
                                .resizable()
                                .frame(width: 100, height: 100)
                            
                            Text("You dont have any items in your cart")
                                .font(.subheadline)
                                .fontWeight(.none)
                                .padding()
                        }
                    } else {
                        List(cartStore.cartItems) { item in
                            CartCellView(cartItem: item)
                        }
                        .safeAreaInset(edge: .bottom) {
                            Button {
                            } label: {
                                HStack(alignment: .bottom) {
                                    Spacer()
                                    Text("Pay \(cartStore.totalPriceString)")
                                        .font(.title3)
                                        .foregroundStyle(.white)
                                        .fontWeight(.bold)
                                    Spacer()
                                }
                            }
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .background(.blue)
                            .clipShape(.rect(cornerRadius: 12))
                            .padding()
                        }
                    }
                }
                .navigationTitle("Cart")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Close")
                                .font(.headline)
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
#Preview("Happy Path") {
    CartListView()
        .environment(
            CartStore(
                cartItems: CartItem.sample,
                apiClient: .testSuccess
            )
        )
}

#Preview("Error") {
    CartListView()
        .environment(
            CartStore(
                cartItems: CartItem.sample,
                apiClient: .testError
            )
        )
}

#Preview("Empty") {
    CartListView()
        .environment(
            CartStore(
                cartItems: [],
                apiClient: .testEmpty
            )
        )
}

#endif
