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
    @Published var globalMetrics: QuotesLatest?
    @Published var tokenMetadata: [Int: TokenMetadata] = [:]
    @Published var showProfile = false
    @Published var showSearch = false
    @Published var showMoreTopics = false
    @Published var sortDirection: SortDirection = .descending
    @Published var currentSortType: SortTypes? = nil
    
    // MARK: - Properties
    
    private var homeService: HomeService
    
    
    // MARK: - Init
    
    init(homeService: HomeService) {
        self.homeService = homeService
        fetchData()
    }
    
    // MARK: - Factory Methods
    
    func fetchData() {
        fetchTopList()
        fetchTopGainers()
        fetchTopics()
        fetchGlobalMetrics()
    }
    
    func fetchGlobalMetrics() {
        homeService.fetchGlobalMetrics { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.globalMetrics = data
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func fetchTopList() {
        homeService.fetchTopList { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.topList = data
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
    
    func gairensRows() -> Int {
        5
    }
    
    // MARK: - Sort Methods
    
    func toggleSort(by type: SortTypes) {
        if currentSortType == type {
            sortDirection.toggle()
        } else {
            currentSortType = type
            sortDirection = .descending
        }
        
        switch type {
        case .marketCap:
            topList.sort {
                sortDirection == .descending ?
                ($0.quote.usd.marketCap ?? 0) > ($1.quote.usd.marketCap ?? 0)
                : ($0.quote.usd.marketCap ?? 0) < ($1.quote.usd.marketCap ?? 0)
            }
        case .price:
            topList.sort {
                sortDirection == .descending ?
                ($0.quote.usd.price) > ($1.quote.usd.price)
                : ($0.quote.usd.price) < ($1.quote.usd.price)
            }
        case .percentChange:
            topList.sort {
                sortDirection == .descending ?
                ($0.quote.usd.percentChange24h ?? 0) > ($1.quote.usd.percentChange24h ?? 0)
                : ($0.quote.usd.percentChange24h ?? 0) < ($1.quote.usd.percentChange24h ?? 0)
            }
        }
    }
}
