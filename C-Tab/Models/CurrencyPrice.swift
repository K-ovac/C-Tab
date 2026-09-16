//
//  Currency.swift
//  C-Tab
//
//  Created by Максим Лозебной on 15.09.2026.
//

enum CurrencyPrice: String, CaseIterable, Identifiable {
    case usd = "USD"
    case rub = "RUB"
    case eur = "EUR"
    case cyn = "CYN"
    
    var id: String { self.rawValue }
    
    var title: String {
        switch self {
        case .usd: return "US Dollar"
        case .rub: return "Russian Ruble"
        case .eur: return "Euro"
        case .cyn: return "Chinese Yuan Renminbi"
        }
    }
    
    var icon: String {
        switch self {
        case .usd: return "dollarsign"
        case .rub: return "rublesign"
        case .eur: return "eurosign"
        case .cyn: return "chineseyuanrenminbisign"
        }
    }
}
