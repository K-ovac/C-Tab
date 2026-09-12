//
//  TokenInfoView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 09.09.2026.
//

import SwiftUI

struct CoinDetailsView: View {
    @State private var isExpanded: Bool = false
    
    let coinMetadata: CoinMetadata
    
    var body: some View {
        NavigationStack {
            List {
                warningTitle
                    .listRowSeparator(.hidden)
                tokenMetricsView
                    .listRowSeparator(.hidden)
                aboutToken
                    .listRowSeparator(.hidden)
            }
            .navigationTitle("Coin Info")
            .navigationBarTitleDisplayMode(.inline)
            
            .listStyle(.inset)
        }
    }
}

extension CoinDetailsView {
    private var warningTitle: some View {
        Text(
            """
            *The token information and pricing data on this page are sourced from third parties (e.g, CoinGecko) and are for reference only. This app makes no warranties and does not constitute investment advice.
            """
        )
        .foregroundStyle(.secondary)
        .font(.footnote)
    }
    
    private var tokenMetricsView: some View {
        Section() {
            CoinMetricsView(coinMetadata: coinMetadata)
        }
    }
    
    private var aboutToken: some View {
        Section {
            VStack(alignment: .leading) {
                Text(coinMetadata.description.en)
                    .lineLimit(isExpanded ? nil : 3)
                
                Button(
                    isExpanded ? "Hide" : "Show More"
                ) {
                    isExpanded.toggle()
                }
                .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } header: {
            Text("What is \(coinMetadata.name)?")
        }
        
    }
}

#Preview {
    CoinDetailsView(
        coinMetadata: CoinMetadata(
            id: "ethereum",
            name: "Ethereum",
            symbol: "ETH",
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
                    usd: 2562.45
                ),
                marketCapRank: 2,
                priceChangePercentage24h: -1.87623
            ),
            
        )
    )
}
