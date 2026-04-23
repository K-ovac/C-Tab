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
    
    init() {
        loadData()
    }
    
    func loadData() {
        topics = [
            Topic(
                id: "1",
                socialImage: "x",
                topicTitle: "Justin Sun has filed a lawsuit...",
                topicHours: "13h"
            ),
            
            Topic(
                id: "2",
                socialImage: "x",
                topicTitle: "The Vovo protocol was hacked...",
                topicHours: "17h"
            )
        ]
        
        gainers = [
            Gainer(
                id: "1",
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
}
