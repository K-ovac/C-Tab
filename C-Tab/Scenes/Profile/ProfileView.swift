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
    @AppStorage("selectedTheme")
    private var selectedTheme: AppTheme = .dark
    
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
                Text("App Version " + Constants.appVersion)
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
        case .currency:
            CurrencyView(title: title)
        case .appTheme:
            AppThemeView(title: title)
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
                    SettingRow(iconName: setting.iconName, title: setting.title, value: setting.destination == .appTheme
                               ? selectedTheme.rawValue
                               : nil
                    )
                }
            }
        }
    }
    
    private var linksSection: some View {
        Section {
            ForEach(viewModel.profileLinks) { link in
                Link(destination: link.link) {
                    SettingRow(iconName: link.iconName, title: link.title, value: nil)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
