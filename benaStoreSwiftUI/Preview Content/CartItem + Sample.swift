//
//  CartItem + Sample.swift
//  benaStoreSwiftUI
//
//  Created by Minata on 22/08/2024.
//

import Foundation

extension CartItem {
    static let sample = Product.sample.map {
        CartItem(product: $0, quantity: 2)
    }
}
