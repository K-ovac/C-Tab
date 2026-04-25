//
//  NetworkClient.swift
//  C-Tab
//
//  Created by Максим Лозебной on 21.04.2026.
//

import Foundation

// MARK: - Aliases

typealias NetworkCompletion = (Result<Data, Error>) -> Void

// MARK: - NetworkError

enum NetworkError: Error {
    case httpStatusCode(Int)
    case urlRequestError(Error)
    case urlSessionError
    case decodeError(Error)
}

// MARK: - NetworkRouting

protocol NetworkRouting {
    func fetchData(url: URL, headers: [String: String], completion: @escaping NetworkCompletion)
}

// MARK: - NetworkClient

struct NetworkClient: NetworkRouting {
    
    // MARK: - Properties
    
    private let session: URLSession
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    
    private static let codeRange = 200..<300
    
    // MARK: - Init
    
    init(
        session: URLSession = URLSession.shared,
        decoder: JSONDecoder = JSONDecoder(),
        encoder: JSONEncoder = JSONEncoder()
    ) {
        self.session = session
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        self.decoder = decoder
        self.encoder = encoder
    }
    
    // MARK: - Private Methods
    
    private func parse<T: Decodable>(_ data: Data,
                                     type _: T.Type
    ) -> Result<T, Error> {
        do {
            let decoded = try decoder.decode(T.self, from: data)
            return .success(decoded)
        } catch {
            return .failure(NetworkError.decodeError(error))
        }
    }
    
    private func request(url: URL,
                         method: String = HttpMethod.get.value,
                         headers: [String: String] = [:]
    ) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        let allHeaders = headers.merging([RequestConstants.apiHeader: RequestConstants.apiKey]) { _, new in new }
        
        allHeaders.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
    
    // MARK: - Factory Methods
    
    func fetchData(url: URL,
                   headers: [String: String] = [:],
                   completion: @escaping NetworkCompletion
    ) {
        let request = request(url: url, headers: headers)
        
        let task = session.dataTask(with: request) { data, response, error in
            print("ERROR:", error as Any)
            print("RESPONSE:", response as Any)
            print("DATA:", data as Any)
            print(url.absoluteString)
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.urlSessionError))
                return
            }
            
            guard NetworkClient.codeRange ~= response.statusCode else {
                completion(.failure(NetworkError.httpStatusCode(response.statusCode)))
                return
            }
            
            if let error = error {
                completion(.failure(NetworkError.urlRequestError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.urlSessionError))
                return
            }
            completion(.success(data))
        }
        
        task.resume()
    }
    
    func parse<T: Decodable>(url: URL,
                             type: T.Type,
                             completion: @escaping (Result<T, Error>) -> Void
    ) {
        fetchData(url: url) { result in
            switch result {
            case .success(let data):
                let parsed = parse(data, type: T.self)
                completion(parsed)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
