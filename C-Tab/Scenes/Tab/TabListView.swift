//
//  TabView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 21.04.2026.
//
import SwiftUI

struct TabListView: View {
    @State var selected: Int = 0
    var body: some View {
        TabView(selection: $selected) {
            HomeView()
                .tag(0)
                .tabItem {
                    Image(systemName: "house")
                }
            Text("Portfolio")
                .tag(1)
                .tabItem {
                    Image(systemName: "folder.fill")
                }
            Text("Wishlist")
                .tag(2)
                .tabItem {
                    Image(systemName: "star")
                }
            Text("Settings")
                .tag(3)
                .tabItem {
                    Image(systemName: "gear")
                }
        }
    }
}

#Preview {
    TabListView()
}
