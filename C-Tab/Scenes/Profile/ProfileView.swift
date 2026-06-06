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
    
    private var appStoreID = "1600000000"
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ProfileRow()
                }
                Section {
                    ForEach(viewModel.profileSetting) { setting in
                        NavigationLink(destination: DetailView(itemTitle: setting.title)) {
                            HStack(spacing: 5) {
                                Image(systemName: setting.iconName)
                                    .foregroundStyle(setting.iconColor)
                                    .font(.title3)
                                    .frame(width: 30, alignment: .center)
                                Text(setting.title)
                                    .font(.body)
                            }
                        }
                    }
                    Link(destination: URL(string: "https://apps.apple.com/app/id\(appStoreID)?action=write-review")!) {
                        HStack {
                            Image(systemName: "hand.thumbsup")
                                .foregroundStyle(.green)
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
            Button {
                
            } label: {
                HStack {
                    Text("Sign Out")
                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                }
                .foregroundStyle(.red)
            }
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
