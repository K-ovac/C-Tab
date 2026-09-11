//
//  MarketInfoRow.swift
//  C-Tab
//
//  Created by Максим Лозебной on 09.06.2026.
//

import SwiftUI

struct GlobalMetricsView: View {
    let globalMetrics: GlobalMetrics
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxHeight: 60)
                .cornerRadius(12)
                .foregroundStyle(Color.gray)
                .opacity(0.3)
            HStack(spacing: 10) {
                VStack(alignment: .leading) {
                    Text("M. Cap %24h")
                        .font(.system(size: 12))
                    Text(String(format: "%.2f%%", globalMetrics.marketCapChangePercentage24hUsd ?? 0))
                        .bold()
                }
                VStack(alignment: .leading) {
                    Text("Active Coins")
                        .font(.system(size: 12))
                    Text(String(globalMetrics.activeCryptocurrencies))
                        .bold()
                }
                VStack(alignment: .leading) {
                    Text("BTC Dominance")
                        .font(.system(size: 12))
                    Text(String.make(for: globalMetrics.marketCapPercentage.btc ?? 0, isPrice: !Constants.isPrice))
                        .bold()
                }
                VStack(alignment: .leading) {
                    Text("ETH Dominance")
                        .font(.system(size: 12))
                    Text(String.make(for: globalMetrics.marketCapPercentage.eth ?? 0, isPrice: !Constants.isPrice))
                        .bold()
                }
            }.frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    GlobalMetricsView(
//        globalMetrics: QuotesLatest(
//            btcDominance: 60.1234,
//            ethDominance: 1.4356,
//            quote: UsdQuoteLatest(
//                usd: QuotesLatestUSD(
//                    totalMarketCap: 2105247258542.7324000,
//                    totalVolume24h: 83611066726.940000,
//                    altcoinMarketCap: 883291575791.1072000,
//                    altcoinVolume24h: 47208449145.790960)
//            )
//        )
        globalMetrics: GlobalMetrics(
            activeCryptocurrencies: 21085,
            marketCapPercentage: MarketCapPercentage(
                btc: 58.22112308753269,
                eth: 11.57710574096172,
                usdt: 6.880044720041529
            ),
            marketCapChangePercentage24hUsd: -2.070869857529571
        )
    )
}
