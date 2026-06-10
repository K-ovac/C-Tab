//
//  MarketInfoRow.swift
//  C-Tab
//
//  Created by Максим Лозебной on 09.06.2026.
//

import SwiftUI

struct GlobalMetricsView: View {
    let globalMetrics: QuotesLatest
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxHeight: 60)
                .cornerRadius(12)
                .foregroundStyle(Color.gray)
                .opacity(0.3)
            HStack {
                VStack(alignment: .leading) {
                    Text("Market Cap")
                        .font(.system(size: 12))
                    Text(String.makeCompact(for: globalMetrics.quote.usd.totalMarketCap ?? 0))
                        .bold()
                }
                VStack(alignment: .leading) {
                    Text("24h Vol")
                        .font(.system(size: 12))
                    Text(String.makeCompact(for: globalMetrics.quote.usd.totalVolume24h ?? 0))
                        .bold()
                }
                VStack(alignment: .leading) {
                    Text("BTC Dominance")
                        .font(.system(size: 12))
                    Text(String.make(for: globalMetrics.btcDominance ?? 0, isPrice: false))
                        .bold()
                }
                VStack(alignment: .leading) {
                    Text("ETH Dominance")
                        .font(.system(size: 12))
                    Text(String.make(for: globalMetrics.ethDominance ?? 0, isPrice: false))
                        .bold()
                }
            }.frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    GlobalMetricsView(
        globalMetrics: QuotesLatest(
            btcDominance: 60.1234,
            ethDominance: 1.4356,
            quote: UsdQuoteLatest(
                usd: QuotesLatestUSD(
                    totalMarketCap: 2105247258542.7324000,
                    totalVolume24h: 83611066726.940000,
                    altcoinMarketCap: 883291575791.1072000,
                    altcoinVolume24h: 47208449145.790960)
            )
        )
    )
}
