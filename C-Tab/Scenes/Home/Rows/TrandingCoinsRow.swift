//
//  TopGainersView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

import SwiftUI
import Kingfisher

struct TrandingCoinsRow: View {
    let coin: TrendingCoin
        
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
                    .currency(code: "USD")
                )
            )
            
            Spacer()
            
            Text(
                String(
                    format: "%.2f%%",
                    coin.data.priceChangePercentage24h.usd ?? 0
                )
            )
            .padding(4)
            .frame(alignment: .center)
            .foregroundStyle(.white.opacity(0.8))
            .background((coin.data.priceChangePercentage24h.usd ?? 0).percentChangeColor)
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

#Preview {
    TrandingCoinsRow(
        coin: TrendingCoin(
            id: "zcash",
            symbol: "ZEC",
            small: "https://coin-images.coingecko.com/coins/images/486/small/Brandmark-Yellow_%281%29.png?1785810558",
            data: TrendingCoinData(
                price: 1471.460312657549,
                priceChangePercentage24h: TrendingCoinPriceChangePercentage24h(
                    btc: 14.998297132365183,
                    usd: 16.324883650304777,
                    eur: 16.933752851653466
                )
            )
        )
    )
}
