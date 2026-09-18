//
//  TokenInfoView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 09.09.2026.
//

import SwiftUI

struct CoinDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var showWebsite: Bool = false
    @State private var isExpanded: Bool = false
    @State private var selectedStat: CoinStatistics?
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
        ZStack(alignment: .bottom) {
            List {
                warningTitle
                    .listRowSeparator(.hidden)
                tokenMetricsView
                    .listRowSeparator(.hidden)
                statistics
                    .listRowSeparator(.hidden)
                aboutToken
                    .listRowSeparator(.hidden)
                links
                    .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            
            if let stat = selectedStat {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        selectedStat = nil
                    }

                DescriptionView(
                    title: stat.rawValue,
                    text: stat.description,
                    onClose: { selectedStat = nil }
                )
                .background(.background)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding()
                
            }
        }
        .navigationBarBackButtonHidden()
        
        .toolbar(.hidden, for: .tabBar)
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
                        .padding(.trailing, 8)
                    Image("hamburger")
                        .resizable()
                        .frame(width: 25, height: 25)
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
                CoinStatisticsView(
                    coinMetadata: coinMetadata,
                    onSelect: { stat in
                        selectedStat = stat
                    }
                )
            }
        }
    }
    
    private var links: some View {
        Section {
            if let coinMetadata = viewModel.coinDetails {
                Button {
                    showWebsite = true
                } label: {
                    HStack() {
                        Image(systemName: "globe")
                            .foregroundStyle(.white)
                        Text("Website")
                            .foregroundStyle(.white)
                            .font(.body)
                    }
                    .padding(4)
                }
                .background(.secondary.opacity(0.6))
                .clipShape(.capsule)
                .sheet(isPresented: $showWebsite) {
                    if let url = URL(string: coinMetadata.links.homepage[0]) {
                        SafariView(url: url)
                    }
                }
            }
        }
    }
}

#Preview {
    TabListView()
}

