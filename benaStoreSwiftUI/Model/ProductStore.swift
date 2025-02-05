//
//  ProductStore.swift
//  benaStoreSwiftUI
//
//  Created by Minata on 22/08/2024.
//

import Foundation

@Observable
class ProductStore {
    enum LoadingState {
        case notStarted
        case loading
        case loaded(result: [Product])
        case empty
        case error(message: String)
    }
    
    private var products: [Product]
    private let apiClient: APIClient
    var loadingState = LoadingState.notStarted
    
    init(apiClient: APIClient = .live) {
        self.products = []
        self.apiClient = apiClient
    }
    
    @MainActor
    func fetchProducts() async {
        do {
            loadingState = .loading
            products = try await apiClient.fetchProducts()
            loadingState = if products.isEmpty {
                .empty
            } else {
                .loaded(result: products)
            }
        } catch {
            loadingState = .error(message: error.localizedDescription)
        }
    }
}
