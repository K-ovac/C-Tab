//
//  ContentView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 21.04.2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button {
                    //
                } label: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(Color.gray)
                }
                
                Spacer()
                
                HStack(alignment: .center) {
                    Image(systemName: "house")
                        .resizable()
                        .frame(width: 35, height: 30)
                        .foregroundStyle(Color.gray)
                    Text("C-Tab")
                        .font(Font.system(size: 20, weight: .black))
                        .foregroundStyle(Color.gray)
                }
                
                Spacer()
                
                HStack {
                    Button {
                        //
                    } label: {
                        Image(systemName: "location.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(Color.gray)
                    }
                    Button {
                        //
                    } label: {
                        Image(systemName: "magnifyingglass.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(Color.gray)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 40)
            
            List {
                Section("Topics") {
                    TopicsView(
                        socialImage: "x",
                        topicTitle: "Justin Sun has field a lawsuit against World Liberty Financial (WLFI).",
                        topicHours: "13h"
                    )
                    TopicsView(
                        socialImage: "x",
                        topicTitle: "The Vovo protocol on Sui was hacked for $3.5 million.",
                        topicHours: "17h"
                    )
                    TopicsView(
                        socialImage: "bybit",
                        topicTitle: "Tether has minted 1 billion USDT on the ETH network.",
                        topicHours: "20h"
                    )
                }
                
                Section("Top Gainers") {
                    TopGainersView(
                        tokenName: "Edge",
                        tokenPrice: "$" + String(1.48),
                        diffPrice: String(11.84) + "%"
                    )
                    TopGainersView(
                        tokenName: "PENGU",
                        tokenPrice: "$" + String(0.008369),
                        diffPrice: String(10.33) + "%"
                    )
                    TopGainersView(
                        tokenName: "PENGU",
                        tokenPrice: "$" + String(0.008369),
                        diffPrice: String(10.33) + "%"
                    )
                }
                
                Section("Top 100") {
                    TopListView(id: "1",
                                tokenLogo: "btc",
                                tokenName: "BTC",
                                tokenCapitalization: 1.57,
                                tokenPrice: 78_536.23,
                                diffPrice: 4.88
                    )
                    TopListView(id: "2",
                                tokenLogo: "eth",
                                tokenName: "ETH",
                                tokenCapitalization: 290.09,
                                tokenPrice: 2_402.48,
                                diffPrice: 3.27
                    )
                    TopListView(id: "3",
                                tokenLogo: "usdt",
                                tokenName: "USDT",
                                tokenCapitalization: 188.49,
                                tokenPrice: 1.00,
                                diffPrice: 0
                    )
                }
            }
            .padding(.horizontal, -16)
            .frame(maxWidth: .infinity)
            .onTapGesture {
                print("tapped")
            }
            .background(Color.clear)
            
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    TabListView()
}
