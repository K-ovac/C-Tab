//
//  TopListView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 22.04.2026.
//

import SwiftUI


struct TopListRow: View {

    let topicItems: TopList

    var body: some View {
        HStack {
            Text(topicItems.id)
                .foregroundStyle(.gray)
            HStack {
                Image(topicItems.tokenLogo)
                    .resizable()
                    .frame(width: 25, height: 25)
                
                VStack(alignment: .leading) {
                    Text(topicItems.tokenName)
                        .font(.headline)
                    Text("$\(topicItems.tokenCapitalization) T")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }

            Spacer()

            HStack(spacing: 10) {
                Text("$\(topicItems.tokenPrice)")
                Text("\(topicItems.diffPrice)%")
                    .padding(.leading, 20)
                    .foregroundStyle(.green)
            }
        }.background(.clear)
    }
}

#Preview {
    TopListRow(
        topicItems: TopList(
            id: "1",
            tokenLogo: "btc",
            tokenName: "BTC",
            tokenCapitalization: "1.57",
            tokenPrice: "78536.23",
            diffPrice: "4.95"
        )
    )
}
