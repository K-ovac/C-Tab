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
    case decodeError(Error)
}

protocol NetworkRouting {
    func fetchData(url: URL, handler: @escaping NetworkCopmletion)
}

struct NetworkClient: NetworkRouting {
    
    private let session: URLSession
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    
    private static let codeRange = 200..<300
    
    init(
        session: URLSession = URLSession.shared,
        decoder: JSONDecoder = JSONDecoder(),
        encoder: JSONEncoder = JSONEncoder()
    ) {
        self.session = session
        self.decoder = decoder
        self.encoder = encoder
    }
    
    private func parse<T: Decodable>(_ data: Data, type _: T.Type) -> Result<T, Error> {
        do {
            let decoded = try decoder.decode(T.self, from: data)
            return .success(decoded)
        } catch {
            return .failure(NetworkError.decodeError(error))
        }
    }
    
    func fetchData(url: URL, handler: @escaping NetworkCopmletion) {
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                handler(.failure(NetworkError.urlSessionError))
                return
            }
            
            guard NetworkClient.codeRange ~= response.statusCode else {
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
    
    func parse<T: Decodable>(url: URL, type: T.Type, handler: @escaping (Result<T, Error>) -> Void) {
        fetchData(url: url) { result in
            switch result {
            case .success(let data):
                let parsed = parse(data, type: T.self)
                handler(parsed)
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
