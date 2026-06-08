//
//  ProfileView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        ProfileRow()
                    }
                    settingsSection
                    linksSection
                }
                Text("App Version 1.0.0")
            }
            .foregroundStyle(.primary)
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

extension ProfileView {
    @ViewBuilder
    private func destinationView(for destination: SettingsDestination, title: String) -> some View{
        switch destination {
        case .language:
            LanguageView(title: title)
        case .appTheme:
            AppThemeView(title: title)
        case .currency:
            CurrencyView(title: title)
        }
    }
    
    private var settingsSection: some View {
        Section {
            ForEach(viewModel.profileSettings) { setting in
                NavigationLink {
                    destinationView(
                        for: setting.destination,
                        title: setting.title
                    )
                } label: {
                    SettingRow(iconName: setting.iconName, title: setting.title)
                }
            }
        }
    }
    
    private var linksSection: some View {
        Section {
            ForEach(viewModel.profileLinks) { link in
                Link(destination: link.link) {
                    SettingRow(iconName: link.iconName, title: link.title)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
