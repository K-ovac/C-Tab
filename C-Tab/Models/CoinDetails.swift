//
//  CoinDetails.swift
//  C-Tab
//
//  Created by Максим Лозебной on 13.09.2026.
//

enum CoinStatistics: String, CaseIterable, Identifiable {
    case high24h = "High 24h"
    case low24h = "Low 24h"
    case marketCap = "Market Cap"
    case circulatingSupply = "Circulating Supply"
    case fullyDilutedValuation = "Fully Diluted Valuation"
    case totalSupply = "Total Supply"
    case marketCapRank = "Market Cap/ FDV Ratio"
    case maxSupply = "Max Supply"
    case totalVolume = "Trading Volume"

    var id: String { self.rawValue }
}

enum CoinHistoricalData: String, CaseIterable, Identifiable {
    case high24h = "High 24h"
    case low24h = "Low 24h"
    
    var id: String { self.rawValue }
}

enum CoinLinksConstants: String, CaseIterable, Identifiable {
    case website
    case twitter
    case facebook
    case github
    case whitepaper
    case chat
    case chatTelegram
    case chatDiscord
    case chatFacebook
    
    var id: String { self.rawValue }
}
