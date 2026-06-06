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
    @State private var isDarkMode: Bool = false
    
    private let appStoreID = "1600000000"
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ProfileRow()
                }
                Section("Settings") {
                    NavigationLink(destination: LanguageView()) {
                        LanguageRow()
                    }
                    NavigationLink(destination: AppThemeView()) {
                        AppThemeRow()
                    }
                    NavigationLink(destination: CurrencyView()) {
                        CurrencyRow()
                    }
                    Link(destination: URL(string: "https://apps.apple.com/app/id\(appStoreID)?action=write-review")!) {
                        HStack {
                            Image(systemName: "hand.thumbsup")
                                .font(.title3)
                                .frame(width: 30, alignment: .center)
                            Text("Rate Our App")
                                .font(.body)
                        }
                    }
                }
            }
            .scrollDisabled(false)
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
            Text("App Version 1.0.0")
        }
    }
}

struct DetailView: View {
    let itemTitle: String
    var body: some View {
        Text("Вы открыли: \(itemTitle)")
            .navigationTitle(itemTitle)
    }
}

#Preview {
    ProfileView()
}
