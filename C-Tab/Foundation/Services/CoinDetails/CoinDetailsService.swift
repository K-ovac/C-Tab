//
//  CoinDetailsService.swift
//  C-Tab
//
//  Created by Максим Лозебной on 12.09.2026.
//

import Foundation

protocol CoinDetailsServiceData {
    func fetchCoinDetails(for id: String) async throws -> CoinMetadata
}

final class CoinDetailsService: CoinDetailsServiceData {
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func fetchCoinDetails(for id: String) async throws -> CoinMetadata {
        let request = CoinDetailsRequest(id: id)
        
        guard let url = request.endpoint else {
            throw NetworkError.urlSessionError
        }
        
        let response = try await networkClient.parse(
            url: url,
            type: CoinMetadata.self
        )
        
        return response
    }
}
