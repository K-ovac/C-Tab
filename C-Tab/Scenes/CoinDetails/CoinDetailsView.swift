//
//  TokenInfoView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 09.09.2026.
//

import SwiftUI

struct CoinDetailsView: View {
    @State private var isExpanded: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                warningTitle
                    .listRowSeparator(.hidden)
                tokenMetricsView
                    .listRowSeparator(.hidden)
                aboutToken
                    .listRowSeparator(.hidden)
            }
            .navigationTitle("Coin Info")
            .navigationBarTitleDisplayMode(.inline)
            
            .listStyle(.inset)
        }
    }
}

extension CoinDetailsView {
    private var warningTitle: some View {
        Text(
            """
            *The token information and pricing data on this page are sourced from third parties (e.g, CoinGecko) and are for reference only. This app makes no warranties and does not constitute investment advice.
            """
        )
        .foregroundStyle(.secondary)
        .font(.caption)
    }
    
    private var tokenMetricsView: some View {
        Section() {
            CoinMetricsView()
        }
    }
    
    private var aboutToken: some View {
        Section {
            VStack(alignment: .leading) {
                Text(
                    """
                    Bitcoin (BTC) is a cryptocurrency launched in 2010. Users are able to generate BTC through the process of mining. Bitcoin has a current supply of 20,082,421. The last known price of Bitcoin is 77,335.98832106 USD and is down -1.77 over the last 24 hours. It is currently trading on 12736 active market(s) with $30,757,481,184.37 traded over the last 24 hours.
                    """
                )
                .lineLimit(isExpanded ? nil : 3)
                
                Button(
                    isExpanded ? "Hide" : "Show More"
                ) {
                    isExpanded.toggle()
                }
                .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } header: {
            Text("What is Bitcoin?")
        }
        
    }
}

#Preview {
    CoinDetailsView()
}
