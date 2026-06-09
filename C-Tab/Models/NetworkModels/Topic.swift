//
//  Topic.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

import Foundation

struct Topic: Identifiable {
    let id: UUID = UUID()
    let socialImage: String
    let topicTitle: String
    let topicHours: String
}
