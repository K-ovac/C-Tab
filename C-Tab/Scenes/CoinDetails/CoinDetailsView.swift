//
//  TokenInfoView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 09.09.2026.
//

import SwiftUI

struct CoinDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var isExpanded: Bool = false
    @StateObject private var viewModel: CoinDetailsViewModel
    
    let coinId: String
    
    init(coinId: String) {
        self.coinId = coinId
        _viewModel = StateObject(
            wrappedValue: CoinDetailsViewModel(
                coinDetailsServise: CoinDetailsService(
                    networkClient: NetworkClient()
                ),
                coinId: coinId
            )
        )
    }
    
    var body: some View {
        
        List {
            warningTitle
                .listRowSeparator(.hidden)
            tokenMetricsView
                .listRowSeparator(.hidden)
            statistics
                .listRowSeparator(.hidden)
            aboutToken
                .listRowSeparator(.hidden)
        }
        .listStyle(.inset)
        .navigationBarBackButtonHidden()
        .toolbar {
            leadingToolBar
        }
        
        .task {
            viewModel.fetchCoinDetails()
        }
        .refreshable {
            viewModel.fetchCoinDetails()
        }
    }
}

extension CoinDetailsView {
    private var leadingToolBar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button {
                dismiss()
            } label: {
                
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left")
                    
                    Text("\(viewModel.coinDetails?.symbol ?? "Coin")/USD".uppercased())
                }
                
            }
        }
    }
    
    private var warningTitle: some View {
        Text(
            """
            *The token information and pricing data on this page are sourced from third parties (e.g, CoinGecko) and are for reference only. This app makes no warranties and does not constitute investment advice.
            """
        )
        .foregroundStyle(.secondary)
        .font(.footnote)
    }
    
    private var tokenMetricsView: some View {
        Section() {
            if let metrics = viewModel.coinDetails {
                CoinMetricsView(coinMetadata: metrics)
            }
            
        }
    }
    
    private var aboutToken: some View {
        Section {
            if let coinMetadata = viewModel.coinDetails {
                VStack(alignment: .leading) {
                    Text(coinMetadata.description.en)
                        .lineLimit(isExpanded ? nil : 3)
                    
                    Button(
                        isExpanded ? "Hide" : "Show More"
                    ) {
                        isExpanded.toggle()
                    }
                    .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        } header: {
            if let coinMetadata = viewModel.coinDetails {
                Text("What is \(coinMetadata.name)?")
            }
        }
    }
    
    private var statistics: some View {
        Section {
            if let coinMetadata = viewModel.coinDetails {
                CoinStatisticsView(coinMetadata: coinMetadata)
            }
        }
    }
}

#Preview {
//    TabListView()
}
