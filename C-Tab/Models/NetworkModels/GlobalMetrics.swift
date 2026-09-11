//
//  QuotesLatest.swift
//  C-Tab
//
//  Created by Максим Лозебной on 25.04.2026.
//

struct GlobalMetrics: Codable {
    let activeCryptocurrencies: Int
    let marketCapPercentage: MarketCapPercentage
    let marketCapChangePercentage24hUsd: Double?
}

struct MarketCapPercentage: Codable {
    let btc: Double?
    let eth: Double?
    let usdt: Double?
}

struct GlobalMetricsData: Codable {
    let data: GlobalMetrics
}
