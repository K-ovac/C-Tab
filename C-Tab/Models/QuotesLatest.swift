//
//  QuotesLatest.swift
//  C-Tab
//
//  Created by Максим Лозебной on 25.04.2026.
//

struct QuotesLatest: Codable {
    let btcDominance: Float
    let ethDominance: Float
    let quote: QuoteLatest
}

struct QuoteLatest: Codable {
    let quote: UsdQuoteLatest
}

struct UsdQuoteLatest: Codable {
    let usd: QuotesLatestUSD
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

struct QuotesLatestUSD: Codable {
    let totalMarketCap: Float
    let totalVolume24h: Float
    let altcoinMarketCap: Float
    let altcoinVolume24h: Float
}

struct QuotesLatestData: Codable {
    let data: QuotesLatest
}
