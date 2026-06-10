//
//  HomeService.swift
//  C-Tab
//
//  Created by Максим Лозебной on 25.04.2026.
//

import Foundation

// MARK: - Aliases

typealias TopListCompletion = (Result<[TokenList], Error>) -> Void
typealias TopGainerCompletion = (Result<[Gainer], Error>) -> Void
typealias GlobalMetricsCompletion = (Result<QuotesLatest, Error>) -> Void

// MARK: - Protocol HomeServiceData

protocol HomeServiceData {
    func fetchTopList(completion: @escaping TopListCompletion)
    func fetchTopGainers(completion: @escaping TopGainerCompletion)
    func fetchGlobalMetrics(completion: @escaping GlobalMetricsCompletion)
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
    
    func fetchTopList(completion: @escaping TopListCompletion) {
        let request = HomeRequest()
        
        guard let url = request.endpoint else {
            completion(.failure(NetworkError.urlSessionError))
            return
        }
        
        networkClient.parse(url: url, type: TopList.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Fetch Top Gainers
    
    func fetchTopGainers(completion: @escaping TopGainerCompletion) {
        let request = TopGainersRequest()
        
        guard let url = request.endpoint else {
            completion(.failure(NetworkError.urlSessionError))
            return
        }
        
        networkClient.parse(url: url, type: TopGainerList.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Fetch Token Metadata
    
    func fetchGlobalMetrics(completion: @escaping GlobalMetricsCompletion) {
        let request = GlobalMetricsRequest()
        
        guard let url = request.endpoint else {
            completion(.failure(NetworkError.urlSessionError))
            return
        }
        
        networkClient.parse(url: url, type: QuotesLatestData.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
