//
//  C_TabApp.swift
//  C-Tab
//
//  Created by Максим Лозебной on 21.04.2026.
//

import SwiftUI

@main
struct C_TabApp: App {
    @AppStorage(Keys.appTheme.value)
    private var selectedTheme: AppTheme = .dark
    @AppStorage(Keys.language.value)
    private var selectedLanguage: Language = .en
    
    var body: some Scene {
        WindowGroup {
            TabListView()
                .preferredColorScheme(selectedTheme.colorScheme)
                .environment(\.locale, Locale(identifier: selectedLanguage.id))
                .id(selectedLanguage)
        }
    }
}
