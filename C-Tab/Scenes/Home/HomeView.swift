//
//  ContentView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 21.04.2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button {
                    print("profile tapped") //method
                } label: {
                    Image(systemName: "person.crop.circle.fill")
                        .tint(Color.gray)
                }
                Spacer()
                HStack {
                    Image(systemName: "house")
                        .tint(Color.gray)
                    Text("C-Tab")
                }
                Spacer()
                Button {
                    print("settings tapped")
                } label: {
                    Image(systemName: "pointer.arrow.ipad")
                        .tint(Color.gray)
                }
                
                Button {
                    print("settings tapped")
                } label: {
                    Image(systemName: "magnifyingglass")
                        .tint(Color.gray)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            
            List {
                Section("Top 100") {
                    Text("Bitcoin")
                    Text("Ethereum")
                    Text("Solana")
                }
                Section("🚀 Top Gainers") {
                    Text("Edge")
                    Text("Sui")
                    Text("Doge")
                }
                
            }
            
        }
        
    }
}

#Preview {
    TabListView()
}
