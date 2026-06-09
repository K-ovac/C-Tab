//
//  AppThemeView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 06.06.2026.
//

import SwiftUI

struct AppThemeView: View {
    @AppStorage("selectedTheme")
    private var selectedTheme: AppTheme = .dark
    
    let title: String
    
    var body: some View {
        VStack {
            List {
                ForEach(AppTheme.allCases) { theme in
                    Button(action: {
                        withAnimation {
                            selectedTheme = theme
                        }
                    }) {
                        HStack {
                            Image(systemName: theme.iconName)
                                .font(.title3)
                                .frame(width: 30, alignment: .center)
                            Text(theme.rawValue)
                                .font(.body)
                            
                            Spacer()
                            
                            if selectedTheme == theme {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.blue)
                            }
                        }
                    }
                    .foregroundStyle(.primary)
                }
            }
            .navigationTitle(title)
        }
        .preferredColorScheme(selectedTheme.colorScheme)
    }
}

#Preview {
    AppThemeView(title: "App Theme")
}
