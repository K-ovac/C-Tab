//
//  TokenMetricsView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 09.09.2026.
//

import SwiftUI

struct CoinMetricsView: View {
    
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
                    
                    Spacer()
                    
                    HStack {
                        Image("rankingStar")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.secondary)
                        Text("No." + "1")
                            .foregroundStyle(.green)
                            .font(.callout.bold())
                    }
                }
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Last price")
                        .font(.callout)
                    
                    HStack{
                        Text("$78131.45")
                            
                        Spacer()
                        
                        Text(String(format: "%.2f%%", 1.6800))
                            .foregroundStyle(.green)
                    }
                    .font(.title)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.primary)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}

#Preview {
    CoinMetricsView()
}
