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
    @Published var topList: [TopList] = []
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
            TopList(
                id: "1",
                tokenLogo: "btc",
                tokenName: "BTC",
                tokenCapitalization: "1.57",
                tokenPrice: "78536.23",
                diffPrice: "4.88"
            ),
            TopList(
                id: "2",
                tokenLogo: "eth",
                tokenName: "ETH",
                tokenCapitalization: "290.09",
                tokenPrice: "2402.48",
                diffPrice: "3.27"
            ),
            TopList(
                id: "3",
                tokenLogo: "usdt",
                tokenName: "USDT",
                tokenCapitalization: "188.99",
                tokenPrice: "1.00",
                diffPrice: "--"
            )
        ]
    }
    
    func openMoreTopics() {
        showMoreTopics = true
    }
}
