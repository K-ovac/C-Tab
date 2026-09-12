//
//  TokenMetadata.swift
//  C-Tab
//
//  Created by Максим Лозебной on 25.04.2026.
//

struct TokenInfo: Codable {
    let id: Int
    let name: String
    let symbol: String
    let desctiption: String
    let logo: String
}

struct TokenId: Codable {
    let id: TokenInfo
}

struct TokenMetadata: Codable {
    let data: [String: TokenInfo]
}
