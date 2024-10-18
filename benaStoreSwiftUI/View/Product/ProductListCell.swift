//
//  ProductListCell.swift
//  benaStoreSwiftUI
//
//  Created by Minata on 22/08/2024.
//

import SwiftUI

struct ProductListCell: View {
    
    @Environment(CartStore.self) private var cartStore
    let product: Product
    
    var body: some View {
        VStack {
            AsyncImage(url: product.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
            } placeholder: {
                ProgressView()
                    .frame(height: 200)
            }
            .padding(.bottom, 10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.title)
                    .font(.system(size: 13))
                    .lineLimit(2)
                
                Text("$\(product.price.description)")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 16)
            
            AddToCartButton(product: product)
        }
        .padding(16)
    }
}

#Preview {
    ProductListCell(product: Product.sample.first!)
        .environment(CartStore())
}
