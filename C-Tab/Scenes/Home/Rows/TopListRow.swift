//
//  TopListView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 22.04.2026.
//

import SwiftUI


struct TopListRow: View {
    
    let token: Token
    
    var body: some View {
        HStack {
            Text(String(token.cmcRank))
                .foregroundStyle(.gray)
            HStack {
                Image("btc")
                    .resizable()
                    .frame(width: 25, height: 25)
                
                VStack(alignment: .leading) {
                    Text(token.symbol)
                        .font(.headline)
                    Text("$" + (token.quote.usd.marketCap ?? 0).formatted(.number.notation(.compactName)))
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer()
            
            HStack(spacing: 10) {
                Text("$" + String(format: "%.2f", token.quote.usd.price))
                Text(String(format: "%.2f", (token.quote.usd.percentChange24h ?? 0)) + "%")
                    .padding(.leading, 20)
                    .foregroundStyle((token.quote.usd.percentChange24h ?? 0).percentChangeColor)
            }
        }.background(.clear)
    }
}

#Preview {
    TopListRow(
        token: Token(
            id: 1,
            name: "Bitcoin",
            symbol: "BTC",
            slug: "bitcoin",
            dateAdded: "2010-07-13",
            lastUpdated: "2026-04-25",
            cmcRank: 1,
            quote: Quote(usd: UsdValues(
                price: 77687.66266199,
                volume24h: 234234.546,
                cexVolume24h: 34654667567,
                dexVolume24h: 435346.546,
                volumeChange24h: -26.234,
                percentChange1h: 0.324,
                percentChange24h: -0.2534,
                percentChange7d: 1.33545,
                percentChange30d: 11.3425,
                percentChange60d: 22.34532,
                percentChange90d: -12.4312,
                marketCap: 155346456457.1242345,
                marketCapDominance: 59.9617
            )
            )
        )
    )
}
