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
        case .usd: return "dollarsign.circle"
        case .rub: return "rublesign.circle"
        case .eur: return "eurosign.circle"
        case .cyn: return "chineseyuanrenminbisign.circle"
        }
    }
}
