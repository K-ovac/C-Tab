//
//  HomeRequest.swift
//  C-Tab
//
//  Created by Максим Лозебной on 25.04.2026.
//

import Foundation

struct HomeRequest: NetworkRequest {
    var endpoint: URL? {
        URL(string: RequestConstants.baseURL + "/v1/cryptocurrency/listings/latest")
    }
    
    var httpMethod: HttpMethod { .get }
}

struct TopGainersRequest: NetworkRequest {
    var endpoint: URL? {
        URL(string: RequestConstants.baseURL + "/v1/cryptocurrency/listings/latest")
    }
    
    var httpMethod: HttpMethod { .get }
}
