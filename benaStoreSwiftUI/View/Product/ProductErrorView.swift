//
//  ProductErrorView.swift
//  benaStoreSwiftUI
//
//  Created by Minata on 22/08/2024.
//

import SwiftUI

struct ProductErrorView: View {
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud")
                .resizable()
                .frame(width: 100, height: 80)
            
            Text("There was a problem reaching the server. please try again later.")
                .font(.headline)
                .padding(20)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    ProductErrorView()
}
