//
//  FloatingTabbar.swift
//  benaStoreSwiftUI
//
//  Created by Minata on 23/08/2024.
//

import SwiftUI

struct FloatingTabbar: View {
    
    @Binding var selectedTab: Int

    var body: some View {
        HStack {
            Spacer(minLength: 0)

            HStack {
                Button {
                    selectedTab = 0
                } label: {
                    Image(systemName: "house")
                        .foregroundStyle(selectedTab == 0 ? .yellow : .white)
                        .padding(.horizontal)
                }

                Spacer(minLength: 15)

                Button {
                    selectedTab = 1
                } label: {
                    Image(systemName: "heart")
                        .foregroundStyle(selectedTab == 1 ? .yellow : .white)
                        .padding(.horizontal)
                }

                Spacer(minLength: 15)

                Button {
                    selectedTab = 2
                } label: {
                    Image(systemName: "cart")
                        .foregroundStyle(selectedTab == 2 ? .yellow : .white)
                        .padding(.horizontal)
                }

                Spacer(minLength: 15)

                Button {
                    selectedTab = 3
                } label: {
                    Image(systemName: "person")
                        .foregroundStyle(selectedTab == 3 ? .yellow : .white)
                        .padding(.horizontal)
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 35)
            .background(Color.teal)
            .clipShape(Capsule())
            .padding(.horizontal, 22) // Corrected this to apply padding only horizontally
            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6), value: selectedTab)
        }
        .padding(.bottom, 24)
        .frame(maxWidth: .infinity, maxHeight: 80, alignment: .bottom) // Aligns to bottom
    }
}

#Preview {
    FloatingTabbar(selectedTab: .constant(0))
}
