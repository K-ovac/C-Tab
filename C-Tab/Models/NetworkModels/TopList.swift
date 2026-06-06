//
//  TopList.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

// MARK: - Token List

struct TokenList: Codable, Identifiable {
    let id: Int
    let name: String
    let symbol: String
    let slug: String
    let dateAdded: String
    let lastUpdated: String
    let cmcRank: Int
    let quote: Quote
}

// MARK: - Usd Values

struct TokenListUSD: Codable {
    let price: Double
    let volume24h: Double?
    let cexVolume24h: Double?
    let dexVolume24h: Double?
    let volumeChange24h: Double?
    let percentChange1h: Double?
    let percentChange24h: Double?
    let percentChange7d: Double?
    let percentChange30d: Double?
    let percentChange60d: Double?
    let percentChange90d: Double?
    let marketCap: Double?
    let marketCapDominance: Double?
}

// MARK: - Quote

struct Quote: Codable {
    let usd: TokenListUSD
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

// MARK: - Top List

struct TopList: Codable {
    let data: [TokenList]
}
