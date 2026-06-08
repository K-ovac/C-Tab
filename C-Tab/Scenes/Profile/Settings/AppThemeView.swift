//
//  AppThemeView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 06.06.2026.
//

import SwiftUI

struct AppThemeView: View {
    @AppStorage("selectedTheme") private var selectedTheme: AppTheme = .light
    
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
                            HStack {
                                Image(systemName: theme.iconName)
                                    .font(.title3)
                                    .frame(width: 30, alignment: .center)
                                Text(theme.rawValue)
                                    .font(.body)
                            }
                            .foregroundStyle(.primary)
                            Spacer()
                            Image(systemName: selectedTheme == theme ? "checkmark" : "")
                        }
                    }
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
