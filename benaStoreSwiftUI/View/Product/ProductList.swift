//
//  ProductList.swift
//  benaStoreSwiftUI
//
//  Created by Minata on 22/08/2024.
//

import SwiftUI

struct ProductList: View {
    
    @Environment(CartStore.self) private var cartStore
    @Environment(ProductStore.self) private var productStore
    @State private var isCartOpen: Bool = false
    
    let column: [GridItem] = [
        GridItem(),
        GridItem()
    ]
    
    var body: some View {
        NavigationStack {
            Group {
                switch productStore.loadingState {
                case .loading, .notStarted:
                    ProgressView()
                        .frame(width: 100, height: 100)
                        .task {
                            await productStore.fetchProducts()
                        }
                    
                case .empty:
                    ContentUnavailableView {
                        Label {
                            Text("No Products Found")
                        } icon: {
                            Image(systemName: "bag.badge.questionmark")
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                    }
                    
                case .error(_):
                    ProductErrorView()
                    
                case .loaded(let products):
                    ScrollView {
                        LazyVGrid(columns: column) {
                            ForEach(products) { product in
                                ProductListCell(product: product)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Products")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isCartOpen = true
                    } label: {
                        Text("Go to cart")
                            .font(.callout)
                            .fontWeight(.semibold)
                    }
                }
            }
            .sheet(isPresented: $isCartOpen) {
                CartListView()
            }
        }
    }
}

#if DEBUG
#Preview("Happy Path") {
    ProductList()
        .environment(ProductStore(apiClient: .testSuccess))
        .environment(CartStore())
}

#Preview("API Error") {
    ProductList()
        .environment(ProductStore(apiClient: .testError))
        .environment(CartStore())
}

#Preview("Empty List") {
    ProductList()
        .environment(ProductStore(apiClient: .testEmpty))
        .environment(CartStore())
}
#endif
