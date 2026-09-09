//
//  TokenMetricsView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 09.09.2026.
//

import SwiftUI

struct TokenMetricsView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxHeight: .infinity)
                .cornerRadius(12)
                .foregroundStyle(Color.gray)
                .opacity(0.3)
            VStack(alignment: .leading) {
                HStack {
                    Image("btc")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("BTC")
                        .font(.title.bold())
                    Text("Bitcoin")
                        .font(.title2)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                
                Text("$78131.45")
                    .foregroundStyle(.primary)
                    .font(.title)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}

#Preview {
    TokenMetricsView()
}
