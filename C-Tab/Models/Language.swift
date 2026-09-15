//
//  Language.swift
//  C-Tab
//
//  Created by Максим Лозебной on 15.09.2026.
//

enum Language: String, Identifiable, CaseIterable {
    case en = "English"
    case ru = "Русский"
    
    var id: String { rawValue }
}
