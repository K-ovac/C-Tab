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
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                trandingCoinsSection
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                topListSection
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            }
            .listStyle(.inset)
            
            .navigationTitle("Markets")
            .navigationBarTitleDisplayMode(.large)
            
            .toolbar {
                leadingToolbar
                trailingToolbar
            }
            
            .navigationDestination(item: $selectedCoinId) { coinId in
                CoinDetailsView(coinId: coinId)
            }
            .navigationDestination(isPresented: $viewModel.topListPresented) {
                TopCoinsListView()
            }
            
            .task {
                viewModel.fetchData()
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
                viewModel.profilePresented.toggle()
            } label: {
                Image(systemName: "person.fill")
            } .sheet(isPresented: $viewModel.profilePresented) {
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
//                    viewModel.profilePresented.toggle()
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
    
    private var trandingCoinsSection: some View {
        Section(
            header: Text("Tranding")
        ) {
            LazyVGrid(columns: viewModel.trandingCoinsColumns()) {
                ForEach(
                    viewModel.trandingCoins
                        .prefix(viewModel.trandingCoinsRows()),
                    id: \.item
                ) { coin in
                    TrandingCoinsRow(coin: coin.item)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedCoinId = coin.item.id
                        }
                }
            }
        }
    }
    
    private var topListSection: some View {
        Section(
            header: Text("Top")
        ) {
            ForEach(viewModel.topList.prefix(7)) { item in
                TopListRow(token: item)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedCoinId = item.id
                    }
            }
            
            Button {
                viewModel.topListPresented.toggle()
            } label: {
                Text("Show more")
                    .foregroundStyle(.primary)
                    .font(.body.bold())
                
            }
            .contentShape(Rectangle())
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(.gray.opacity(0.3))
            .clipShape(.capsule)
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
    }
}

#Preview {
    TabListView()
}

