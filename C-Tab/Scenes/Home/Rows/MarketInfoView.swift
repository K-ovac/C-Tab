//
//  MarketInfoRow.swift
//  C-Tab
//
//  Created by Максим Лозебной on 09.06.2026.
//

import SwiftUI

struct MarketInfoView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxHeight: 60)
                .cornerRadius(12)
                .foregroundStyle(Color.gray)
                .opacity(0.3)
            HStack {
                VStack(alignment: .leading) {
                    Text("Market Cap")
                        .font(.system(size: 12))
                    Text("$2.60T")
                        .bold()
                }
                VStack(alignment: .leading) {
                    Text("24h Vol")
                        .font(.system(size: 12))
                    Text("$77.58B")
                        .bold()
                }
                VStack(alignment: .leading) {
                    Text("BTC Dominance")
                        .font(.system(size: 12))
                    Text("57.62%")
                        .bold()
                }
                VStack(alignment: .leading) {
                    Text("ETH Dominance")
                        .font(.system(size: 12))
                    Text("9.56%")
                        .bold()
                }
            }.frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    MarketInfoView()
}
