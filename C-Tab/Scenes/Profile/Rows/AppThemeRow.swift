//
//  AppThemeRow.swift
//  C-Tab
//
//  Created by Максим Лозебной on 04.06.2026.
//

import SwiftUI

struct AppThemeRow: View {
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "lightbulb.min")
                .font(.title3)
                .frame(width: 30, alignment: .center)
            Text("App Theme")
                .font(.body)
            Spacer()
            Text("Dark")
                .foregroundStyle(.gray)
                .font(.subheadline)
        }
    }
}

#Preview {
    AppThemeRow()
}
