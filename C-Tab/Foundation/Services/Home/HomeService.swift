//
//  HomeService.swift
//  C-Tab
//
//  Created by Максим Лозебной on 25.04.2026.
//

import Foundation

// MARK: - Aliases

//typealias TopListCompletion = (Result<[TokenList], Error>) -> Void
//typealias TopGainerCompletion = (Result<[Gainer], Error>) -> Void
//typealias GlobalMetricsCompletion = (Result<GlobalMetrics, Error>) -> Void
//typealias TrendingCoinsCompletion = (Result<[TrendingCoinItem], Error>) -> Void

// MARK: - Protocol HomeServiceData

protocol HomeServiceData {
    func fetchTopList(currency: String) async throws -> [TokenList]
    func fetchGlobalMetrics() async throws -> GlobalMetrics
    func fetchTrendingCoins(currency: String) async throws -> [TrendingCoinItem]
}

// MARK: - HomeService

final class HomeService: HomeServiceData {
    
    // MARK: - Properties
    
    private let networkClient: NetworkClient
    
    // MARK: - Init
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    // MARK: - Fetch Top List
    
    func fetchTopList(currency: String) async throws -> [TokenList] {
        let request = HomeRequest(
            currency: currency
        )
        
        guard let url = request.endpoint else {
            throw NetworkError.urlSessionError
        }
        
        let response = try await networkClient.parse(
            url: url,
            type: [TokenList].self
        )
        
        return response
    }
    
    // MARK: - Fetch Token Metadata
    
    func fetchGlobalMetrics() async throws -> GlobalMetrics {
        let request = GlobalMetricsRequest()
        
        guard let url = request.endpoint else {
            throw NetworkError.urlSessionError
        }
        
        let response = try await networkClient.parse(
            url: url,
            type: GlobalMetricsData.self
        )
        
        return response.data
    }
    
    func fetchTrendingCoins(currency: String) async throws -> [TrendingCoinItem] {
        let request = TrendingCoinsRequest(currency: currency)
        
        guard let url = request.endpoint else {
            throw NetworkError.urlSessionError
        }
        
        let response = try await networkClient.parse(
            url: url,
            type: TrendingCoinsProvider.self
        )
        
        return response.coins
    }
}
