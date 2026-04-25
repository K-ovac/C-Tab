//
//  HomeService.swift
//  C-Tab
//
//  Created by Максим Лозебной on 25.04.2026.
//

import Foundation

typealias TopListCompletion = (Result<[Token], Error>) -> Void

final class HomeService {
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
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
}
