//
//  RankCrypto.swift
//  C-Tab
//
//  Created by Максим Лозебной on 11.06.2026.
//

enum RankCrypto: String, CaseIterable, Identifiable {
    case top10 = "Top 10"
    case top100 = "Top 100"
    case top300 = "Top 300"
    case allTokens = "All Tokens"
    
    var id: String { self.rawValue }
}

enum PriceChange: String, CaseIterable, Identifiable {
    case hour = "1 Hour"
    case day = "24 Hours"
    case month = "1 Month"
    
    var id: String { self.rawValue }
}
