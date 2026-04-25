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
    
    func fetchTokenMetadata(for tokens: [TokenList]) {
//        let ids = tokens.map { $0.id }
//        
//        homeService.fetchTokenMetadata(id: ids) { [weak self] result in
//            guard let self else { return }
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let data):
//                    self.tokenMetadata = data
//                case .failure(let error):
//                    print(error)
//                }
//            }
//        }
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
