//
//  HomeViewModel.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    
    @Published var topics: [Topic] = []
    @Published var gainers: [Gainer] = []
    @Published var topList: [Token] = []
    @Published var showProfile = false
    @Published var showSearch = false
    @Published var showMoreTopics = false
    
    init() {
        loadData()
    }
    
    func loadData() {
        topics = [
            Topic(
                id: "1",
                socialImage: "x",
                topicTitle: "MegaETH announced the TGE for April 30.",
                topicHours: "13h"
            ),
            
            Topic(
                id: "2",
                socialImage: "x",
                topicTitle: "Tether has frozen 344 million USDT on the Tron network.",
                topicHours: "17h"
            ),
            Topic(
                id: "3",
                socialImage: "bybit",
                topicTitle: "Blockchain Capital plans to raise $700 million for two new funds.",
                topicHours: "23h"
            )
        ]
        
        gainers = [
            Gainer(
                id: "1",
                tokenImage: "tray.circle.fill",
                tokenName: "Edge",
                tokenPrice: "1.54",
                diffPrice: "10.83"
            )
        ]
        
        topList = [
            Token(
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
                    marketCap: 1_553.1242345,
                    marketCapDominance: 59.9617
                ))
            ),
            Token(
                id: 2,
                name: "Ethereum",
                symbol: "ETH",
                slug: "ethereum",
                dateAdded: "2010-07-13",
                lastUpdated: "2026-04-25",
                cmcRank: 1,
                quote: Quote(usd: UsdValues(
                    price: 2687.66266199,
                    volume24h: 234234.546,
                    cexVolume24h: 34654667567,
                    dexVolume24h: 435346.546,
                    volumeChange24h: -26.234,
                    percentChange1h: 0.324,
                    percentChange24h: 1.2534,
                    percentChange7d: 1.33545,
                    percentChange30d: 11.3425,
                    percentChange60d: 22.34532,
                    percentChange90d: -12.4312,
                    marketCap: 534.1242345,
                    marketCapDominance: 59.9617
                ))
            ),
        ]
    }
    
    func openMoreTopics() {
        showMoreTopics = true
    }
    
    func sortByCapitalization() {
        topList.sort { $0.quote.usd.marketCap > $1.quote.usd.marketCap }
    }
    
    func sortByTokenPrice() {
        topList.sort { $0.quote.usd.price > $1.quote.usd.price }
    }
    
    func sortByDiffPrice() {
        topList.sort { $0.quote.usd.percentChange24h > $1.quote.usd.percentChange24h }
    }
}
