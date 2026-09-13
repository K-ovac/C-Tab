//
//  CoinStatisticsView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 13.09.2026.
//

import SwiftUI

struct CoinStatisticsView: View {
    private let colums: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let coinMetadata: CoinMetadata
    
    var body: some View {
        LazyVGrid(columns: colums, alignment: .leading) {
            ForEach(CoinStatistics.allCases) { stat in
                VStack(alignment: .leading) {
                    Text(stat.rawValue)
                        .foregroundStyle(.secondary)
                        .font(.body)
                    
                    switch stat {
                    case .high24h:
                        Text(coinMetadata.marketData.high24h.usd.formatted(.currency(code: "USD")))
                    case .low24h:
                        Text(coinMetadata.marketData.low24h.usd.formatted(.currency(code: "USD")))
                    case .marketCap:
                        Text(coinMetadata.marketData.marketCap.usd.formatted(.currency(code: "USD")))
                    case .circulatingSupply:
                        Text(coinMetadata.marketData.circulatingSupply.formatted(.currency(code: "USD")))
                    case .fullyDilutedValuation:
                        Text(coinMetadata.marketData.circulatingSupply.formatted(.currency(code: "USD")))
                    case .totalSupply:
                        Text(coinMetadata.marketData.fullyDilutedValuation.usd.formatted(.currency(code: "USD")))
                    case .marketCapRank:
                        Text(String(coinMetadata.marketData.marketCapRank))
                    case .maxSupply:
                        coinMetadata.marketData.maxSupply != nil
                        ? Text(
                            (coinMetadata.marketData.maxSupply ?? 0).formatted(.number)
                        )
                        : Text("∞")
                    case .totalVolume:
                        Text(coinMetadata.marketData.totalVolume.usd.formatted(.currency(code: "USD")))
                    }
                }
                
            }
        }
        
    }
}

#Preview {
    CoinStatisticsView(
        coinMetadata: CoinMetadata(
            id: "ethereum",
            name: "Ethereum",
            symbol: "eth",
            description: CoinDescription(
                en: "bla bla bla",
                ru: "",
                zh: ""
            ),
            image: CoinImage(
                small: "https://coin-images.coingecko.com/coins/images/279/small/ethereum.png?1696501628"
            ),
            marketData: CoinMarketData(
                currentPrice: CoinCurrentPrice(
                    btc: 1,
                    usd: 2562.45
                ),
                marketCapRank: 2,
                priceChangePercentage24h: -1.87623,
                fullyDilutedValuation: CoinCurrentValue(btc: 1, usd: 123),
                marketCap: CoinCurrentValue(btc: 1, usd: 1234),
                totalVolume: CoinCurrentValue(btc: 1, usd: 12345),
                circulatingSupply: 12334,
                totalSupply: 123456,
                maxSupply: 21000000,
                high24h: CoinCurrentPrice(
                    btc: 0.3,
                    usd: 2500
                ),
                low24h: CoinCurrentPrice(
                    btc: 0.1,
                    usd: 2000
                )
            ),
            links: CoinLinks(
                homepage: ["https://www.ethereum.org/"]
            ),
            
        )
    )
}
