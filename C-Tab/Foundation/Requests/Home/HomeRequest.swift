//
//  HomeRequest.swift
//  C-Tab
//
//  Created by Максим Лозебной on 25.04.2026.
//

import Foundation

struct HomeRequest: NetworkRequest {
    var endpoint: URL? {
        URL(string: RequestConstants.baseURL + "coins/markets?vs_currency=usd")
    }
    
    var httpMethod: HttpMethod { .get }
}

struct GlobalMetricsRequest: NetworkRequest {
    var endpoint: URL? {
        URL(string: RequestConstants.baseURL + "/v1/global-metrics/quotes/latest")
    }
    
    var httpMethod: HttpMethod { .get }
}

struct TopGainersRequest: NetworkRequest {
    var endpoint: URL? {
        URL(string: RequestConstants.baseURL + "/v1/cryptocurrency/listings/latest")
    }
    
    var httpMethod: HttpMethod { .get }
}
