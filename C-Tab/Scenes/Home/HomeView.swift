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
    @State private var selectedCoinId: String?
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            List {
                marketInfoSection
                    .listRowSeparator(.hidden)
                //                topicsSection
                //                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                //                    .listRowSeparator(.hidden)
                //                    .listRowBackground(Color.clear)
//                topGainersSection
//                    .listRowSeparator(.hidden)
                topListSection
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
//
            }
            .listStyle(.inset)
            
            .navigationTitle("Markets")
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
            .navigationDestination(item: $selectedCoinId) { coinId in
                CoinDetailsView(coinId: coinId)
            }
            
            .refreshable() {
                viewModel.fetchData()
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
            if let metrics = viewModel.globalMetrics {
                GlobalMetricsView(globalMetrics: metrics)
            }
        }
    }
    
    private var topicsSection: some View {
        Section {
            ForEach(viewModel.topics) { topic in
                TopicsRow(topic: topic)
            }
        } header: {
            TopicsHeader(action: viewModel.openMoreTopics)
        }
    }
    
    private var topGainersSection: some View {
        Section(
            header: Text("Top Gainers")
        ) {
            ForEach(viewModel.gainers.prefix(viewModel.gairensRows())) { gainer in
//                TrandingCoinsRow(gainer: gainer)
            }
        }
    }
    
    private var topListSection: some View {
        Section {
            ForEach(viewModel.topList.prefix(viewModel.topListRows())) { item in
                TopListRow(token: item)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedCoinId = item.id
                    }
            }
        } header: {
            TopListHeader(
                actionSort: viewModel.toggleSort(by:),
                currentSort: viewModel.currentSortType,
                sortDirection: viewModel.sortDirection,
                rankCtrypto: $viewModel.rankCrypto,
                priceChange: $viewModel.priceChange
            )
        }
    }
}

#Preview {
    TabListView()
}
