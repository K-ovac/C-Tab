//
//  LanguageView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 06.06.2026.
//

import SwiftUI

struct LanguageView: View {
    var body: some View {
        List {
            Section {
                Text("Русский")
                Text("English")
            }
            .listRowSeparator(.hidden)
        }
//        .listStyle(.plain)
        .navigationTitle("Language")
        
        
    }
}

#Preview {
    LanguageView()
}
