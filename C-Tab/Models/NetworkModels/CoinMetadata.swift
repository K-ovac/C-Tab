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
    let links: CoinLinks
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case description
        case image
        case marketData = "market_data"
        case links
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
    let fullyDilutedValuation: CoinCurrentValue
    let marketCap: CoinCurrentValue
    let totalVolume: CoinCurrentValue
    let circulatingSupply: Double
    let totalSupply: Double
    let maxSupply: Int?
    let high24h: CoinCurrentPrice
    let low24h: CoinCurrentPrice
    
    enum CodingKeys: String, CodingKey {
        case currentPrice = "current_price"
        case marketCapRank = "market_cap_rank"
        case priceChangePercentage24h = "price_change_percentage_24h"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case marketCap = "market_cap"
        case totalVolume = "total_volume"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case high24h = "high_24h"
        case low24h = "low_24h"
    }
}

struct CoinCurrentPrice: Codable {
    let btc: Double
    let usd: Double
}

struct CoinLinks: Codable {
    let homepage: [String]
}

struct CoinCurrentValue: Codable {
    let btc: Int
    let usd: Int
}
