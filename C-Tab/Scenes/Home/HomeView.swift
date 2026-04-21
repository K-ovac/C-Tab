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
            Image(systemName: "house.circle")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Home")
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
