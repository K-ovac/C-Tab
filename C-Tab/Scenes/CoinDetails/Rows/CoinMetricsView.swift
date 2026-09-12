//
//  TokenMetricsView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 09.09.2026.
//

import SwiftUI
import Kingfisher

struct CoinMetricsView: View {
    
    let coinMetadata: CoinMetadata
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxHeight: .infinity)
                .cornerRadius(12)
                .foregroundStyle(Color.gray)
                .opacity(0.3)
            VStack(alignment: .leading) {
                HStack {
                    KFImage(URL(string: coinMetadata.image.small))
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text(coinMetadata.symbol)                                             //coin symbol
                        .font(.title.bold())
                        .foregroundStyle(.primary)
                    Text(coinMetadata.name)                                         //coin name
                        .font(.title2.bold())
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    HStack {
                        Image("rankingStar")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.secondary)
                        Text(                                               //coin m cap rank
                            "No." +
                            String(coinMetadata.marketCapRank)
                        )
                            .foregroundStyle(.green)
                            .font(.callout.bold())
                    }
                }
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Last price")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    
                    HStack{
                        Text(
                            String(
                                coinMetadata.marketData.currentPrice.usd.formatted(
                                    .currency(code: "USD")
                                )
                            )
                        )
                        
                        Spacer()
                        
                        Text(
                            String(
                                format: "%.2f%%",
                                coinMetadata.priceChangePercentage24h ?? 0
                            )
                        )
                        .foregroundStyle(
                            (coinMetadata.priceChangePercentage24h ?? 0)
                                .percentChangeColor
                        )
                    }
                    .font(.title.bold())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.primary)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}

#Preview {
    CoinMetricsView(
        coinMetadata: CoinMetadata(
            id: "ethereum",
            name: "Ethereum",
            symbol: "ETH",
            desctiption: CoinDescription(
                description: CoinDescriptionLanguage(
                    en: "bla bla bla",
                    ru: "",
                    zh: ""
                )
            ),
            image: CoinImage(
                small: "https://coin-images.coingecko.com/coins/images/279/small/ethereum.png?1696501628"
            ),
        marketCapRank: 2,
        marketData: CoinMarketData(
            currentPrice: CoinCurrentPrice(
                usd: 2562.45
            )
        ),
            priceChangePercentage24h: -1.87623
    )
    )
}
