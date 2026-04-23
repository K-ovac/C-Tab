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
                        .listRowInsets(EdgeInsets(top: 5, leading: 16, bottom: 0, trailing: 16))
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    topGainersSection
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    topListSection
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                } .listStyle(.grouped)
                    .scrollContentBackground(.hidden)
                
            } .navigationTitle("List")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    leadingToolbar
                    trailingToolbar
                }
                .navigationDestination(isPresented: $viewModel.showSearch) {
                    SearchView()
                }
                .navigationDestination(isPresented: $viewModel.showMoreTopics) {
                    MoreTopicsView()
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
                TopicsRow(topicsItems: topic)
            }
        } header: {
            TopicsHeader(action: viewModel.openMoreTopics)
        }
    }
    
    private var topGainersSection: some View {
        Section {
            ForEach(viewModel.gainers) { gainer in
                TopGainersRow(topGainersItems: gainer)
            }
        } header: {
            TopGainerHeader()
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
