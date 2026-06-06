//
//  CurrencyRow.swift
//  C-Tab
//
//  Created by Максим Лозебной on 06.06.2026.
//

import SwiftUI

struct CurrencyRow: View {
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "dollarsign.circle")
                .font(.title3)
                .frame(width: 30, alignment: .center)
            Text("Currency")
                .font(.body)
            Spacer()
            Text("RUB")
                .foregroundStyle(.gray)
                .font(.subheadline)
        }
    }
}

#Preview {
    CurrencyRow()
}
