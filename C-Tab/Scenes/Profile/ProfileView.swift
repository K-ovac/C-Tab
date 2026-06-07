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
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        ProfileRow()
                    }
                    Section {
                        NavigationLink(destination: AppThemeView()) {
                            AppThemeRow()
                        }
                        NavigationLink(destination: CurrencyView()) {
                            CurrencyRow()
                        }
                    }
                    Section {
                        Button {
                            viewModel.openSystemSettings()
                        } label: {
                            LanguageRow()
                        }
                        Link(destination: viewModel.openPrivacyPolicy()) {
                            HStack {
                                Image(systemName: "document")
                                    .font(.title3)
                                    .frame(width: 30, alignment: .center)
                                Text("Privacy Policy")
                                    .font(.body)
                                
                            }
                        }
                        Link(destination: viewModel.rateApp()) {
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
                Text("App Version 1.0.0")
            }
            .foregroundStyle(.primary)
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
        }
    }
}

#Preview {
    ProfileView()
}
