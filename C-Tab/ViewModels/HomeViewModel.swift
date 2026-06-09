//
//  HomeViewModel.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    @Published var topics: [Topic] = []
    @Published var gainers: [Gainer] = []
    @Published var topList: [TokenList] = []
    @Published var tokenMetadata: [Int: TokenMetadata] = [:]
    @Published var showProfile = false
    @Published var showSearch = false
    @Published var showMoreTopics = false
    
    // MARK: - Properties
    
    private var homeService: HomeService
    
    // MARK: - Init
    
    init(homeService: HomeService) {
        self.homeService = homeService
        fetchTopList()
        fetchTopGainers()
        fetchTopics()
    }
    
    // MARK: - Factory Methods
    
    func fetchTopList() {
        homeService.fetchTopList { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.topList = data
                    print(data)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func fetchTopGainers() {
        homeService.fetchTopGainers { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.gainers = data
                    print(data)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func fetchTopics() {
        topics = [
            Topic(
                socialImage: "x",
                topicTitle: "Justin Sun has filed a lawsuit...",
                topicHours: "13h"
            ),
            
            Topic(
                socialImage: "x",
                topicTitle: "The Vovo protocol was hacked...",
                topicHours: "17h"
            ),
            Topic(
                socialImage: "bybit",
                topicTitle: "rtbtynyumyunb",
                topicHours: "21h"
            )
        ]
    }
    
    // MARK: - Factory Methods
    
    func openMoreTopics() {
        showMoreTopics = true
    }
    
    // MARK: - Sort Methods
    
    func sortByCapitalization() {
        topList.sort { ($0.quote.usd.marketCap) ?? 0 > ($1.quote.usd.marketCap) ?? 0 }
    }
    
    func sortByTokenPrice() {
        topList.sort { $0.quote.usd.price > $1.quote.usd.price }
    }
    
    func sortByDiffPrice() {
        topList.sort { ($0.quote.usd.percentChange24h) ?? 0 > ($1.quote.usd.percentChange24h) ?? 0 }
    }
}
