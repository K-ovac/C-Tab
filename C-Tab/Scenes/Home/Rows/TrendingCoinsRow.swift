//
//  TopGainersView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

import SwiftUI
import Kingfisher

struct TrendingCoinsRow: View {
    let coin: TrendingCoin
    let currency: String
        
    var body: some View {
        HStack {
            if let url = URL(string: coin.small) {
                KFImage(url)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
            }
            
            Text(
                coin.data.price.formatted(
                    .currency(code: currency)
                )
            )
            
            Spacer()
            
            Text(
                String(
                    format: "%.2f%%",
                    coin.data.priceChangePercentage24h.currency(for: currency) ?? 0
                )
            )
            .padding(4)
            .frame(alignment: .center)
            .foregroundStyle(.white.opacity(0.8))
            .background((coin.data.priceChangePercentage24h.currency(for: currency) ?? 0).percentChangeColor)
            .cornerRadius(8)
            
        }
        .padding(4)
        .background(.gray.opacity(0.3))
        .cornerRadius(8)
        .foregroundStyle(.primary)
        .font(.body)
        .bold()
    }
}
