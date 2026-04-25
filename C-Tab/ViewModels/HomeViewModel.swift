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
    
    private var homeService: HomeService
    
    init(homeService: HomeService) {
        self.homeService = homeService
        loadData()
    }
    
    func loadData() {
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
    
    func openMoreTopics() {
        showMoreTopics = true
    }
    
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
