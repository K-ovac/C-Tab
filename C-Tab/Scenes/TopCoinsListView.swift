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
        .listStyle(.inset)
        .navigationDestination(item: $viewModel.selectedCoinId) { coinId in
            CoinDetailsView(coinId: coinId)
        }
        
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
                viewModel.topList
                    .prefix(
                        viewModel.topListRows()
                    )
            ) { coin in
                HStack {
                    Text(String(coin.marketCapRank))
                        .font(.body)
                        .foregroundColor(.secondary)
                        .frame(minWidth: 20, alignment: .center)
                    
                    TopListRow(token: coin)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.selectedCoinId = coin.id
                        }
                }
                
            }
        }
    }
}

#Preview {
//    TopCoinsListView()
}
