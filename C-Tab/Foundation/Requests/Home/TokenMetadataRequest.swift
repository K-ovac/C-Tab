//
//  TokenMetadataRequest.swift
//  C-Tab
//
//  Created by Максим Лозебной on 25.04.2026.
//

import Foundation

struct TokenMetadataRequest: NetworkRequest {
    let id: Int
    var endpoint: URL? {
        URL(string: RequestConstants.baseURL + "/v2/cryptocurrency/info?id=" + String(id))
    }
    
    var httpMethod: HttpMethod { .get }
}
