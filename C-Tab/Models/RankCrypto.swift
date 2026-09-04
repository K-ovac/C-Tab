//
//  RankCrypto.swift
//  C-Tab
//
//  Created by Максим Лозебной on 11.06.2026.
//

enum RankCrypto: String, CaseIterable, Identifiable {
    case top100 = "Top 100"
    case top300 = "Top 300"
    case allTokens = "All Crypto"
    
    var id: String { self.rawValue }
}
