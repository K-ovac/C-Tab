//
//  QuotesLatest.swift
//  C-Tab
//
//  Created by Максим Лозебной on 25.04.2026.
//

struct QuotesLatest: Codable {
    let btcDominance: Double?
    let ethDominance: Double?
    let quote: UsdQuoteLatest
}

//struct QuoteLatest: Codable {
//    let quote: UsdQuoteLatest
//}

struct UsdQuoteLatest: Codable {
    let usd: QuotesLatestUSD
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

struct QuotesLatestUSD: Codable {
    let totalMarketCap: Double?
    let totalVolume24h: Double?
    let altcoinMarketCap: Double?
    let altcoinVolume24h: Double?
}

struct QuotesLatestData: Codable {
    let data: QuotesLatest
}
