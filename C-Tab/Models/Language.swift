//
//  Language.swift
//  C-Tab
//
//  Created by Максим Лозебной on 15.09.2026.
//

enum Language: String, Identifiable, CaseIterable {
    case en, ru, fr
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .en: "English"
        case .ru: "Русский"
        case .fr: "Français"
        }
    }
    
    var icon: String {
        switch self {
        case .en: return "unitedKingdom"
        case .ru: return "russia"
        case .fr: return "france"
        }
    }
}
