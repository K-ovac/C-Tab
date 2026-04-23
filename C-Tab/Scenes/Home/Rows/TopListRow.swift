//
//  TopListView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 22.04.2026.
//

import SwiftUI


struct TopListRow: View {

    let topListItems: TopList

    var body: some View {
        HStack {
            Text(topListItems.id)
                .foregroundStyle(.gray)
            HStack {
                Image(topListItems.tokenLogo)
                    .resizable()
                    .frame(width: 25, height: 25)
                
                VStack(alignment: .leading) {
                    Text(topListItems.tokenName)
                        .font(.headline)
                    Text("$\(topListItems.tokenCapitalization) T")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }

            Spacer()

            HStack(spacing: 10) {
                Text("$" + topListItems.tokenPrice)
                Text(topListItems.diffPrice + "%")
                    .padding(.leading, 20)
                    .foregroundStyle(.green)
            }
        }.background(.clear)
    }
}

#Preview {
    TopListRow(
        topListItems: TopList(
            id: "1",
            tokenLogo: "btc",
            tokenName: "BTC",
            tokenCapitalization: "1.57",
            tokenPrice: "78536.23",
            diffPrice: "4.95"
        )
    )
}
