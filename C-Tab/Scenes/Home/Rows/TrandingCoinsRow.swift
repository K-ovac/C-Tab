//
//  TopGainersView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

import SwiftUI

struct TrandingCoinsRow: View {
        
    var body: some View {
        HStack {
            Image("btc")
                .resizable()
                .frame(width: 25, height: 25)
                .clipShape(Circle())
            
            Text("BTC")
            
            Spacer()
            
            Text(
                78193.23.formatted(.currency(code: "USD"))
            )
            
            Text(
                String(
                    format: "%.2f%%",
                    0.18
                )
            )
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .frame(minWidth: 75, alignment: .center)
            .foregroundStyle(0.18.percentChangeColor)
            .background(.gray.opacity(0.3))
            .cornerRadius(8)
            
        }
        .foregroundStyle(.primary)
        .font(.body)
        .bold()
    }
}

#Preview {
    TrandingCoinsRow()
}
