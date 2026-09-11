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
                .foregroundStyle(.gray)
            HStack {
                KFImage(URL(string: token.image)!)
                    .resizable()
                    .frame(width: 25, height: 25)
                
                VStack(alignment: .leading) {
                    Text(token.symbol.uppercased())  //token name
                        .font(.headline)
                    Text(String(token.marketCap)) //token market cap
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer()
            
            HStack(spacing: 10) {
                Text(String(token.currentPrice))   //coin price
                Text(String(format: "%.2f%%", token.priceChangePercentage24h ?? "-")) //coin price change percentage
                    .foregroundStyle(.primary)
            }
        }.background(.clear)
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
            marketCapRank: 1,
            priceChangePercentage24h: 0.6099
        )
    )
}
