//
//  CartStore.swift
//  benaStoreSwiftUI
//
//  Created by Minata on 22/08/2024.
//

import Foundation

@Observable
class CartStore {
    enum SendOrderStatus: Equatable {
        case notStarted
        case loading
        case success
        case error
    }
    
    var cartItems: [CartItem] = []
    private let apiClient: APIClient
    var sendOrderStatus = SendOrderStatus.notStarted
    
    init(cartItems: [CartItem] = [], apiClient: APIClient = .live) {
        self.cartItems = cartItems
        self.apiClient = apiClient
    }
    
    var isSendingOrder: Bool {
        sendOrderStatus == .loading
    }
    
    func addToCart(product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(product: product, quantity: 1))
        }
    }
    
    func removeFromCart(product: Product) {
        guard let index = cartItems.firstIndex(where: { $0.product.id == product.id }) else { return }
        
        if cartItems[index].quantity > 1 {
            cartItems[index].quantity -= 1
        } else {
            cartItems.remove(at: index)
        }
    }
    
    func removeProductFromCart(product: Product) {
        guard let index = cartItems.firstIndex(where: { $0.product.id == product.id }) else { return }
        
        cartItems.remove(at: index)
    }
    
    func removeAllProducts() {
        cartItems.removeAll()
    }
    
    func totalAmount() -> Double {
        cartItems.reduce(0.0) {
            $0 + $1.product.price * Double($1.quantity)
        }
    }
    
    var totalPriceString: String {
        let roundedValue = round(totalAmount() * 100) / 100.0
        return "$\(roundedValue)"
    }
    
    func quantity(for product: Product) -> Int {
        cartItems.first { $0.product.id == product.id }?.quantity ?? 0
    }
    
    func sendOrder() async {
        do {
            sendOrderStatus = .loading
            _ = try await apiClient.sendOrder(cartItems)
            sendOrderStatus = .success
        } catch {
            sendOrderStatus = .error
            print("Error sending order: \(error.localizedDescription)")
        }
    }
}
