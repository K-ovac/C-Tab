//
//  CoinDetailsService.swift
//  C-Tab
//
//  Created by Максим Лозебной on 12.09.2026.
//

import Foundation

typealias CoinDetailsCopmletion = (Result<CoinMetadata, Error>) -> Void

protocol CoinDetailsServiceData {
    func fetchCoinDetails(for id: String, completion: @escaping CoinDetailsCopmletion)
}

final class CoinDetailsService: CoinDetailsServiceData {
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func fetchCoinDetails(for id: String, completion: @escaping CoinDetailsCopmletion) {
        let request = CoinDetailsRequest(id: id)
        
        guard let url = request.endpoint else {
            completion(.failure(NetworkError.urlSessionError))
            
            return
        }
        
        networkClient.parse(url: url, type: CoinMetadata.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
