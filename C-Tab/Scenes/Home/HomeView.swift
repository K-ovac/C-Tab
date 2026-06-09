//
//  ContentView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 21.04.2026.
//

import SwiftUI

// MARK: - HomeView

struct HomeView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel = HomeViewModel(
        homeService: HomeService(
            networkClient: NetworkClient()
        )
    )
        
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    marketInfoSection
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    topicsSection
                        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    topGainersSection
                        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    topListSection
                        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                } .listStyle(.grouped)
                    .scrollContentBackground(.hidden)
                
            } .navigationTitle("Markets")
                .navigationBarTitleDisplayMode(.large)
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

// MARK: - Extension Home View

extension HomeView {
    
    // MARK: - Toolbar
    
    private var leadingToolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                viewModel.showProfile.toggle()
            } label: {
                Image(systemName: "person.fill")
            } .sheet(isPresented: $viewModel.showProfile) {
                ProfileView()
                    .presentationDetents([.large])
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
    
    // MARK: - Tokens List
    
    private var marketInfoSection: some View {
        Section {
            MarketInfoView()
        }
    }
    
    private var topicsSection: some View {
        Section {
            ForEach(viewModel.topics) { topic in
                TopicsRow(iconTopic: topic.socialImage, title: topic.topicTitle, hours: topic.topicHours)
            }
        } header: {
            TopicsHeader(action: viewModel.openMoreTopics)
        }
    }
    
    private var topGainersSection: some View {
        Section {
            ForEach(viewModel.gainers.prefix(5)) { gainer in
                TopGainersRow(gainer: gainer)
            }
        } header: {
            TopGainerHeader()
        }
    }
    
    private var topListSection: some View {
        Section {
            ForEach(viewModel.topList) { item in
                TopListRow(token: item)
            }
        } header: {
            TopListHeader(
                actionSortByMarketCap: viewModel.sortByCapitalization,
                actionSortByPrice: viewModel.sortByTokenPrice,
                actionSortByPercent24h: viewModel.sortByDiffPrice
            )
        }
    }
}

#Preview {
    TabListView()
}
