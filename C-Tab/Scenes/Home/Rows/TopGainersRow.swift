//
//  TopGainersView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

import SwiftUI

struct TopGainersRow: View {
    
    let gainer: Gainer
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "usdt")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.green)
                Text(gainer.symbol)
            }
            Spacer()
            
            HStack(spacing: 50) {
                Text(String(format: "%.2f", gainer.quote.usd.price))
                    .font(.system(size: 17))
                Text(String(format: "%.2f", gainer.quote.usd.percentChange24h ?? 0))
                    .background(Color.green)
                    .cornerRadius(8)
            }
            
        }
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    TopGainersRow(
        gainer: Gainer(
            id: 1,
            name: "Bitcoin",
            symbol: "BTC",
            slug: "bitcoin",
            dateAdded: "2010-07-13",
            lastUpdated: "2026-04-25",
            cmcRank: 1,
            quote: GainerQuote(usd: GainerUSD(
                price: 0.66266199,
                volume24h: -26.234,
                percentChange1h: 0.324,
                percentChange24h: -0.2534,
                percentChange7d: 1.33545,
                marketCap: 1553464564578.1242345
            )
            )
        )
    )
}
