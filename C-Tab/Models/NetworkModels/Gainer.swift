//
//  Gainer.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

// MARK: - Token List

struct Gainer: Codable, Identifiable {
    let id: Int
    let name: String
    let symbol: String
    let slug: String
    let dateAdded: String
    let lastUpdated: String
    let cmcRank: Int
    let quote: GainerQuote
}

// MARK: - Usd Values

struct GainerUSD: Codable {
    let price: Double
    let volume24h: Double?
    let percentChange1h: Double?
    let percentChange24h: Double?
    let percentChange7d: Double?
    let marketCap: Double?
}

// MARK: - Quote

struct GainerQuote: Codable {
    let usd: GainerUSD
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

// MARK: - Top List

struct TopGainerList: Codable {
    let data: [Gainer]
}

