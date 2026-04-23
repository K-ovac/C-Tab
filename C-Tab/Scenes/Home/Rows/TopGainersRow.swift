//
//  TopGainersView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

import SwiftUI

struct TopGainersRow: View {
    
    let topGainersItems: Gainer
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: topGainersItems.tokenImage)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.green)
                Text(topGainersItems.tokenName)
            }
            Spacer()
            
            HStack(spacing: 50) {
                Text(topGainersItems.tokenPrice)
                    .font(.system(size: 17))
                Text(topGainersItems.diffPrice)
                    .background(Color.green)
                    .cornerRadius(8)
            }
            
        }
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    TopGainersRow(
        topGainersItems: Gainer(
            id: "1",
            tokenImage: "tray.circle.fill",
            tokenName: "Edge",
            tokenPrice: "$" + String(1.48),
            diffPrice: String(11.84) + "%"
        )
    )
}
