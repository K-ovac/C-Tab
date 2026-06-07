//
//  LanguageRow.swift
//  C-Tab
//
//  Created by Максим Лозебной on 04.06.2026.
//

import SwiftUI

struct LanguageRow: View {
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "globe.badge.chevron.backward")
                .font(.title3)
                .frame(width: 30, alignment: .center)
            Text("Language")
                .font(.body)
        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    LanguageRow()
}
