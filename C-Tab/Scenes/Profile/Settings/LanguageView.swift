//
//  LanguageView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 08.06.2026.
//

import SwiftUI

struct LanguageView: View {
    let title: String
    
    var body: some View {
        Text("Открыт \(title)")
            .navigationTitle(title)
    }
}

#Preview {
    LanguageView(title: "Language")
}
