//
//  C_TabApp.swift
//  C-Tab
//
//  Created by Максим Лозебной on 21.04.2026.
//

import SwiftUI

@main
struct C_TabApp: App {
    @AppStorage("selectedTheme") private var selectedTheme: AppTheme = .light
    
    var body: some Scene {
        WindowGroup {
            TabListView()
                .preferredColorScheme(selectedTheme.colorScheme)
        }
    }
}
