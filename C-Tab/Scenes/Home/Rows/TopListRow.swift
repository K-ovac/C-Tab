//
//  TopListView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 22.04.2026.
//

import SwiftUI
import Kingfisher

struct TopListRow: View {
    
    let token: TokenList
    
    var body: some View {
        HStack(spacing: 10) {
            Text(String(token.marketCapRank))
                .foregroundStyle(.secondary)
                .font(.body.bold())
            HStack {
                KFImage(URL(string: token.image)!)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(.circle)
                
                VStack(alignment: .leading) {
                    Text(token.symbol.uppercased())  //token name
                        .font(.body.bold())
                        .foregroundStyle(.primary)
                    Text(
                        String(
                            token.marketCap.formatted(
                                .number.notation(.compactName)
                            )
                        )
                    ) //token market cap
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            
            Spacer()
            
            HStack(spacing: 10) {
                Text(
                    String(
                        token.currentPrice.formatted(
                            .currency(code: "USD")
                        )
                    )
                )   //coin price
                .font(.body.bold())
                .foregroundStyle(.primary)
                    
                Text(
                    String(
                        format: "%.2f%%", (token.priceChangePercentage24h ?? 0)
                    )
                ) //coin price change percentage
                    .font(.body.bold())
                    .foregroundStyle(
                        (token.priceChangePercentage24h ?? 0).percentChangeColor
                    )
            }
        }
    }
}

#Preview {
    TopListRow(
        token: TokenList(
            id: "bitcoin",
            symbol: "btc",
            name: "Bitcoin",
            image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
            currentPrice: 77171,
            marketCap: 1549652231921,
            marketCapRank: 100,
            priceChangePercentage24h: 0.6099
        )
    )
}
