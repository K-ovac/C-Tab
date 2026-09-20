//
//  TopCoinsListView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 17.09.2026.
//

import SwiftUI

struct TopCoinsListView: View {
    @StateObject private var viewModel = HomeViewModel(
        homeService: HomeService(
            networkClient: NetworkClient()
        )
    )
        
    var body: some View {
        List {
            topListRow
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .listRowInsets(
                    EdgeInsets(
                        top: 0,
                        leading: 16,
                        bottom: 0,
                        trailing: 16
                    )
                )
        }
        .listStyle(.grouped)
        .scrollContentBackground(.hidden)
        
        .navigationDestination(item: $viewModel.selectedCoinId) { coinId in
            CoinDetailsView(coinId: coinId)
        }
        
        .toolbar(.hidden, for: .tabBar)
        .searchable(
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Solana, SOL"
        )
        
        .task {
            viewModel.fetchTopList()
        }
        .refreshable {
            viewModel.fetchTopList()
        }
    }
}

extension TopCoinsListView {
    private var topListRow: some View {
        Section(
            header: TopListHeader(
                actionSort: viewModel.toggleSort(by:),
                currentSort: viewModel.currentSortType,
                sortDirection: viewModel.sortDirection,
                rankCtrypto: $viewModel.rankCrypto,
                priceChange: $viewModel.priceChange
            )
        ) {
            ForEach(
                viewModel.filteredCoins
                    .prefix(
                        viewModel.topListRows()
                    )
            ) { coin in
                HStack {
                    Text(String(coin.marketCapRank))
                        .font(.body)
                        .foregroundColor(.secondary)
                        .frame(minWidth: 20, alignment: .center)
                    
                    TopListRow(token: coin, currency: viewModel.selectedCurrency)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.selectedCoinId = coin.id
                        }
                }
                
            }
        }
    }
}
