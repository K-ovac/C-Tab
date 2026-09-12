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
    let desctiption: CoinDescription
    let image: CoinImage
    let marketCapRank: Int
    let marketData: CoinMarketData
    let priceChangePercentage24h: Double?
}

struct CoinDescription: Codable {
    let description: CoinDescriptionLanguage
}

struct CoinDescriptionLanguage: Codable {
    let en: String
    let ru: String
    let zh: String
}

struct CoinImage: Codable {
    let small: String
}

struct CoinMarketData: Codable {
    let currentPrice: CoinCurrentPrice
}

struct CoinCurrentPrice: Codable {
    let usd: Double
}
