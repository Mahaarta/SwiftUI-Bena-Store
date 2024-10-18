//
//  APIClient.swift
//  benaStoreSwiftUI
//
//  Created by Minata on 22/08/2024.
//

import Foundation

struct APIClient {
    var fetchProducts: () async throws -> [Product]
    var sendOrder: ([CartItem]) async throws -> String
    
    struct Failure: Error, Equatable {}
}

extension APIClient {
    static let live = Self(
        fetchProducts: {
            let url = URL(string: "https://fakestoreapi.com/products")!
            let (data, response) = try await URLSession.shared.data(from: url)
            let products = try JSONDecoder().decode([Product].self, from: data)
            return products
        },
        
        sendOrder: { cartItems in
            let payload = try JSONEncoder().encode(cartItems)
            var urlRequest = URLRequest(url: URL(string: "https://fakestoreapi.com/carts")!)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpMethod = "POST"
            let (data, response) = try await URLSession.shared.upload(for: urlRequest, from: payload)
            
            guard let httpResponse = (response as? HTTPURLResponse) else {
                throw Failure()
            }
            
            return "Status: \(httpResponse.statusCode)"
        }
    )
    
    
#if DEBUG
    static let testSuccess = Self(
        fetchProducts: {
            try await Task.sleep(nanoseconds: 1000)
            return Product.sample
        }, 
        
        sendOrder: { cartItems in
            "OK"
        }
    )
    
    static let testEmpty = Self(
        fetchProducts: {
            try await Task.sleep(nanoseconds: 1000)
            return []
        },
        
        sendOrder: { cartItems in
            "OK"
        }
    )
    
    static let testError = Self(
        fetchProducts: {
            try await Task.sleep(nanoseconds: 1000)
            throw Failure()
        },
        
        sendOrder: { cartItems in
            "OK"
        }
    )
#endif
}
