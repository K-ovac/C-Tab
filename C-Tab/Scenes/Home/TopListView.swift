//
//  TopListView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 22.04.2026.
//

import SwiftUI

struct TopListView: View {
    
    var id: String
    var tokenLogo: String
    var tokenName: String
    var tokenCapitalization: Float
    var tokenPrice: Float
    var diffPrice: Float
    
    var body: some View {
        HStack {
            Text(id)
                .foregroundStyle(Color.gray)
            
            HStack {
                Image(tokenLogo)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.yellow)
                VStack(alignment: .leading) {
                    Text(tokenName)
                        .font(Font.system(size: 17, weight: .bold))
                    Text("$" + String(tokenCapitalization) + " " + "T")
                        .font(Font.system(size: 13, weight: .regular))
                        .foregroundStyle(Color.gray)
                    
                }
            }
            
            Spacer()
            
            HStack(spacing: 50) {
                Text("$" + String(tokenPrice))
                
                Text(String(diffPrice) + "%")
                    .foregroundStyle(.green)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TopListView(
        id: "1",
        tokenLogo: "btc",
        tokenName: "BTC",
        tokenCapitalization: 1.57,
        tokenPrice: 78_536.23,
        diffPrice: 3.88
    )
}
