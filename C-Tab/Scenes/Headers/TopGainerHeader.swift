//
//  TopGainerHeader.swift
//  C-Tab
//
//  Created by Максим Лозебной on 24.04.2026.
//

import SwiftUI

struct TopGainerHeader: View {
    
    @State var rankCtrypto: RankCrypto
    
    var body: some View {
        Picker("By Rank", selection: $rankCtrypto) {
            ForEach(RankCrypto.allCases) { rank in
                Text(rank.id).tag(rank)
            }
        }
    }
}

#Preview {
    TopGainerHeader(rankCtrypto: .top100)
}
