//
//  TokenMetadata.swift
//  C-Tab
//
//  Created by Максим Лозебной on 25.04.2026.
//

struct CoinMetadata: Codable, Identifiable {
    let id: String
    let name: String
    let symbol: String
    let description: CoinDescription
    let image: CoinImage
    let marketData: CoinMarketData
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case description
        case image
        case marketData = "market_data"
    }
}

struct CoinDescription: Codable {
    let en: String
    let ru: String
    let zh: String
}

struct CoinImage: Codable {
    let small: String
}

struct CoinMarketData: Codable {
    let currentPrice: CoinCurrentPrice
    let marketCapRank: Int
    let priceChangePercentage24h: Double?
    
    enum CodingKeys: String, CodingKey {
        case currentPrice = "current_price"
        case marketCapRank = "market_cap_rank"
        case priceChangePercentage24h = "price_change_percentage_24h"
    }
}

struct CoinCurrentPrice: Codable {
    let usd: Double
}
