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
    case totalVolume = "Trading Volume"
    case maxSupply = "Max Supply"
    
    var id: String { self.rawValue }
    
    var description: String {
        switch self {
        case .high24h: 
            return "Highest price in 24 hours"
        case .low24h:
            return "Lowest price in 24 hours"
        case .marketCap: 
            return """
                Market Cap = Current Price x Circulating Supply\n
                Refers to the total market value of a cryptocurrency's circulating supply. It is similar to the stock market's measurement of multiplying price per share by shares readily available in the market (not held & locked by insiders, governments).
                """
        case .circulatingSupply:
            return """
                The amount of coins that are circulating in the market and are tradeable by the public. It is comparable to looking at shares readily available in the market (not held & locked by insiders, governments).
                """
        case .fullyDilutedValuation:
            return """
                FDV = Current Price x Total Supply \n
                Fully Diluted Valuation (FDV) is the theoretical market capitalization of a coin if the entirety of its supply is in circulation, based on its current market price.
                The FDV value is theoretical as increasing the circulating supply of a coin may impact its market price. Also depending on the tokenomics, emission schedule or lockup period of a coin's supply, it may take a significant time before its entire supply is released into circulation.
                """
        case .totalSupply:
            return """
                The amount of coins that have already been created, minus any coins that have been burned (removed from circulation). It is comparable to outstanding shares in the stock market.\n
                Total Supply = Onchain supply - burned tokens
                """
        case .totalVolume:
            return """
                A measure of a cryptocurrency trading volume across all tracked platforms in the last 24 hours. This is tracked on a rolling 24-hour basis with no open/closing times.
                """
        case .maxSupply:
            return """
                The maximum number of coins coded to exist in the lifetime of the cryptocurrency. It is comparable to the maximum number of issuable shares in the stock market.\n
                Max Supply = Theoretical maximum as coded
                """
        }
    }
}
