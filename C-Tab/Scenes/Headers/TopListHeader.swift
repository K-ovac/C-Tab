//
//  TopListHeader.swift
//  C-Tab
//
//  Created by Максим Лозебной on 24.04.2026.
//

import SwiftUI

struct TopListHeader: View {
    
    let actionSort: (SortTypes) -> Void
    let currentSort: SortTypes?
    let sortDirection: SortDirection
    @State var rankCtrypto: RankCrypto
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundStyle(.gray)
                        .opacity(0.3)
                    Picker("By Rank", selection: $rankCtrypto) {
                        ForEach(RankCrypto.allCases) { rank in
                            Text(rank.id).tag(rank)
                        }
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundStyle(.gray)
                        .opacity(0.3)
                    
                    Button {
                        //
                    } label: {
                        Text("24h %")
                            .foregroundStyle(.primary)
                            .font(.system(size: 14, weight: .regular))
                    }
                }
            } .frame(height: 35)
            
            HStack {
                Button {
                    actionSort(.marketCap)
                } label: {
                    Text("Asset/M.Cap")
                        .font(.system(size: 11, weight: .regular))
                    sortImage(for: .marketCap)
                }
                Spacer()
                
                HStack(spacing: 10) {
                    Button {
                        actionSort(.price)
                    } label: {
                        Text("Price")
                            .font(.system(size: 11, weight: .regular))
                        sortImage(for: .price)
                    }
                    
                    Button {
                        actionSort(.percentChange)
                    } label: {
                        Text("24h %")
                            .font(.system(size: 11, weight: .regular))
                        sortImage(for: .percentChange)
                    } .padding(.leading, 20)
                }
            }.foregroundStyle(.primary)
        }
    }
}

extension TopListHeader {
    private func sortImage(for type: SortTypes) -> some View {
        Image(
            systemName: currentSort == type
            ? (sortDirection == .descending ? "chevron.down" : "chevron.up") 
            : "chevron.down"
        )
        .resizable()
        .frame(width: 8, height: 6)
        .foregroundStyle(currentSort == type ? .blue : .secondary)
    }
}

#Preview {
    //    TopListHeader()
}
