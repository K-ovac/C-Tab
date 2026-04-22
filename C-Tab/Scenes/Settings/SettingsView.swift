//
//  SettingsView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 21.04.2026.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Image(systemName: "gear")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Settings")
        }
        .padding()
    }
}

#Preview {
    TabListView()
}
