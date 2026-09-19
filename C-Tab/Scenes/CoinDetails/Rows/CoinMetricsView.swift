//
//  TokenMetricsView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 09.09.2026.
//

import SwiftUI
import Kingfisher

struct CoinMetricsView: View {
    @State private var isPresented: Bool = false
    
    let coinMetadata: CoinMetadata
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxHeight: .infinity)
                .cornerRadius(12)
                .foregroundStyle(Color.gray)
                .opacity(0.1)
            VStack(alignment: .leading) {
                HStack {
                    if let url = URL(string: coinMetadata.image.small) {
                        KFImage(url)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(.circle)
                    }
                    
                    Text(coinMetadata.symbol.uppercased())                                             //coin symbol
                        .font(.title.bold())
                        .foregroundStyle(.primary)
                    Text(coinMetadata.name)                                         //coin name
                        .font(.title2.bold())
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    Button {
                        isPresented.toggle()
                    } label: {
                        HStack {
                            Image("rankingStar")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.secondary)
                            Text(                                               //coin m cap rank
                                "No." +
                                String(coinMetadata.marketData.marketCapRank)
                            )
                            .foregroundStyle(.green)
                            .font(.callout.bold())
                            .underline()
                        }
                    }
                    .contentShape(Rectangle())
                }
                Spacer()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("coinMetrics.lastPrice.title")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        Text(
                            String(
                                coinMetadata.marketData.currentPrice.usd.formatted(
                                    .currency(code: "USD")
                                )
                            )
                        )
                        .font(.title.bold())
                    }
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("coinMetrics.percentageChange24h.title")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        Text(
                            String(
                                format: "%.2f%%",
                                coinMetadata.marketData.priceChangePercentage24h ?? 0
                            )
                        )
                        .foregroundStyle(
                            (coinMetadata.marketData.priceChangePercentage24h ?? 0)
                                .percentChangeColor)
                        .font(.title.bold())
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.primary)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .navigationDestination(isPresented: $isPresented) {
            TopCoinsListView()
        }
    }
}
