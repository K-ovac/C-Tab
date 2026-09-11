//
//  TopList.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

// MARK: - Token List

struct TokenList: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let marketCap: Double
    let marketCapRank: Int
    let priceChangePercentage24h: Double?
}
