//
//  ContentView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 21.04.2026.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                
                List {
                    topicsSection
                    topListSection
                        .listRowSeparator(.hidden)
                } .listStyle(.grouped)
                
            } .navigationTitle("List")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    leadingToolbar
                    trailingToolbar
                }
                .navigationDestination(isPresented: $viewModel.showSearch) {
                    SearchView()
                }
        }
    }
}

extension HomeView {
    
    private var leadingToolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                viewModel.showProfile.toggle()
            } label: {
                Image(systemName: "person.fill")
            } .sheet(isPresented: $viewModel.showProfile) {
                ProfileView()
            }
        }
    }
    
    private var trailingToolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            HStack {
                Button {
                    print("category tapped")
                } label: {
                    Image(systemName: "square.grid.2x2")
                }
                Button {
                    print("search tapped")
                    viewModel.showSearch.toggle()
                } label: {
                    Image(systemName: "magnifyingglass")
                }
            }
        }
    }
    
    private var topicsSection: some View {
        Section {
            ForEach(viewModel.topics) { topic in
                TopicsRow(
                    socialImage: topic.socialImage,
                    topicTitle: topic.topicTitle,
                    topicHours: topic.topicHours
                )
            }
        } header: {
            TopicsHeader()
        }
    }
    
    private var topListSection: some View {
        Section {
            ForEach(viewModel.topList) { item in
                TopListRow(topListItems: item)
            }
        } header: {
            TopListHeader()
        } .frame(maxWidth: .infinity)
    }
}

#Preview {
    TabListView()
}
