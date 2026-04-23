//
//  TopListView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 22.04.2026.
//

import SwiftUI


struct TopListRow: View {

    let item: TopList

    var body: some View {
        HStack {
            Text(item.id)
                .foregroundStyle(.gray)
            HStack {
                Image(item.tokenLogo)
                    .resizable()
                    .frame(width: 25, height: 25)
                
                VStack(alignment: .leading) {
                    Text(item.tokenName)
                        .font(.headline)
                    Text("$\(item.tokenCapitalization) T")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }

            Spacer()

            HStack {
                Text("$\(item.tokenPrice)")
                Text("\(item.diffPrice)%")
                    .foregroundStyle(.green)
            }
        }.background(.clear)
    }
}

#Preview {
    TopListRow(
        item: TopList(
            id: "1",
            tokenLogo: "btc",
            tokenName: "BTC",
            tokenCapitalization: 1.57,
            tokenPrice: 78536.23,
            diffPrice: 4.95
        )
    )
}
