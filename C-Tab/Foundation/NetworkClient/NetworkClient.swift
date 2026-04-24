//
//  NetworkClient.swift
//  C-Tab
//
//  Created by Максим Лозебной on 21.04.2026.
//

import Foundation

typealias NetworkCopmletion = (Result<Data, Error>) -> Void

enum NetworkError: Error {
    case httpStatusCode(Int)
    case urlRequestError(Error)
    case urlSessionError
    case decodingError(Error)
}

protocol NetworkRouting {
    func fetchData(url: URL, handler: @escaping NetworkCopmletion)
}

struct NetworkClient: NetworkRouting {
    
    private let session: URLSession
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    
    init(
        session: URLSession = URLSession.shared,
        decoder: JSONDecoder = JSONDecoder(),
        encoder: JSONEncoder = JSONEncoder()
    ) {
        self.session = session
        self.decoder = decoder
        self.encoder = encoder
    }
    
    func fetchData(url: URL, handler: @escaping NetworkCopmletion) {
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                handler(.failure(NetworkError.urlSessionError))
                return
            }
            
            guard 200..<300 ~= response.statusCode else {
                handler(.failure(NetworkError.httpStatusCode(response.statusCode)))
                return
            }
            
            if let data = data {
                handler(.success(data))
                return
            } else if let error = error {
                handler(.failure(error))
                return
            } else {
                assertionFailure("Unexpected condition!")
                return
            }
        }
        
        task.resume()
    }
}
