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
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.title3)
                .frame(width: 30, alignment: .center)
            Text(title)
                .font(.body)
        }
    }
}

#Preview {
    SettingRow(iconName: "globe", title: "Currency")
}
