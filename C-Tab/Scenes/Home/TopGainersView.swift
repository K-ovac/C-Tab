//
//  TopGainersView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

import SwiftUI

struct TopGainersView: View {
//    var tokenImage: Image
    var tokenName: String
    var tokenPrice: String
    var diffPrice: String
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "tray.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.green)
                Text(tokenName)
            }
            Spacer()
            
            HStack(spacing: 50) {
                Text(tokenPrice)
                    .font(.system(size: 17))
                Text(diffPrice)
                    .background(Color.green)
                    .cornerRadius(8)
            }
            
        }
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    TopGainersView(
//        tokenImage: Image(systemName: "tray.circle.fill"),
        tokenName: "Edge",
        tokenPrice: "$" + String(1.48),
        diffPrice: String(11.84) + "%"
    )
}
