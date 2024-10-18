//
//  HomeView.swift
//  benaStoreSwiftUI
//
//  Created by Minata on 22/08/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedTab: Int = 0
    @State private var productStore = ProductStore()
    @State private var cartStore = CartStore()
    
    var body: some View {
        
        ZStack {
            VStack {
                if selectedTab == 0 {
                    ProductList()
                        .environment(productStore)
                        .environment(cartStore)
                } else {
                    Text("Selected tab \(selectedTab)")
                }
            }
            
            VStack {
                Spacer()
                FloatingTabbar(selectedTab: $selectedTab)
            }
            .ignoresSafeArea(edges: .bottom)
        }
        
    }
}

#Preview {
    HomeView()
}
