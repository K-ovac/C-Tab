//
//  SettingRow.swift
//  C-Tab
//
//  Created by Максим Лозебной on 08.06.2026.
//

import SwiftUI

struct SettingRow: View {
    let iconName: String
    let title: String
    let value: String?
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.title3)
                .frame(width: 30, alignment: .center)
            Text(title)
                .font(.body)
            
            Spacer()
            
            if let value {
                Text(value)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            } else {
                Image(systemName: "arrow.up.right.square")
            }
        }
    }
}

#Preview {
    SettingRow(iconName: "globe", title: "Currency", value: "Rub")
}
