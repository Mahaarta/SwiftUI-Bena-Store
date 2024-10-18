//
//  CartItem.swift
//  benaStoreSwiftUI
//
//  Created by Minata on 22/08/2024.
//

import Foundation

struct CartItem: Equatable, Identifiable {
    var id = UUID()
    let product: Product
    var quantity: Int
}

extension CartItem: Encodable {
    private enum CartItemsKey: String, CodingKey {
        case productId
        case quantity
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CartItemsKey.self)
        try container.encode(product.id, forKey: .productId)
        try container.encode(quantity, forKey: .quantity)
    }
}
