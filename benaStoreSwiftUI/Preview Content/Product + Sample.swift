//
//  Product + Sample.swift
//  benaStoreSwiftUI
//
//  Created by Minata on 22/08/2024.
//

import Foundation

extension Product {
    static var sample: [Product] = [
        Product(
            id: 1,
            title: "T-shirt",
            price: 20,
            description: "This is a description of a cool T-shirt",
            category: "SomeArticle",
            imageURL: URL(string: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")!
        ),
        Product(
            id: 2,
            title: "T-shirt",
            price: 20,
            description: "This is a description of a cool T-shirt",
            category: "SomeArticle",
            imageURL: URL(string: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")!
        ),
        Product(
            id: 3,
            title: "T-shirt",
            price: 20,
            description: "This is a description of a cool T-shirt",
            category: "SomeArticle",
            imageURL: URL(string: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")!
        )
    ]
}
