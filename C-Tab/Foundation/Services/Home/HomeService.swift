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
typealias TokenMetadataCompletion = (Result<TokenInfo, Error>) -> Void

// MARK: - Protocol HomeServiceData

protocol HomeServiceData {
    func fetchTopList(completion: @escaping TopListCompletion)
    func fetchTopGainers(completion: @escaping TopGainerCompletion)
    func fetchTokenMetadata(id: [Int], completion: @escaping TokenMetadataCompletion)
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
    
    func fetchTokenMetadata(id: [Int], completion: @escaping TokenMetadataCompletion) {
//        let request = TokenMetadataRequest(id: id)
//        
//        guard let url = request.endpoint else {
//            completion(.failure(NetworkError.urlSessionError))
//            return
//        }
//        
//        networkClient.parse(url: url, type: TokenMetadata.self) { result in
//            switch result {
//            case .success(let response):
//                if let metadata = response.data[String(id)] {
//                    completion(.success(metadata))
//                } else {
//                    completion(.failure(NetworkError.decodeError(NSError())))
//                }
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
    }
}
