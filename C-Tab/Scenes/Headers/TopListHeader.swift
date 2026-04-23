//
//  TopListHeader.swift
//  C-Tab
//
//  Created by Максим Лозебной on 24.04.2026.
//

import SwiftUI

struct TopListHeader: View {
    
    let actionSortByCapitalization: () -> Void
    let actionSortByPrice: () -> Void
    let actionSortByDiffPrice: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundStyle(.gray)
                        .opacity(0.3)
                    Button {
                        //
                    } label: {
                        Text("Top 100")
                            .foregroundStyle(.white)
                            .font(.system(size: 14, weight: .regular))
                        
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
                            .foregroundStyle(.white)
                            .font(.system(size: 14, weight: .regular))
                    }
                }
            } .frame(height: 35)
            
            HStack {
                Button {
                    actionSortByCapitalization()
                } label: {
                    Text("Asset/M.Cap")
                        .font(.system(size: 11, weight: .regular))
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 8, height: 6)
                }
                Spacer()
                
                HStack(spacing: 10) {
                    Button {
                        actionSortByPrice()
                    } label: {
                        Text("Price")
                            .font(.system(size: 11, weight: .regular))
                        Image(systemName: "chevron.down")
                            .resizable()
                            .frame(width: 8, height: 6)
                    }
                    
                    Button {
                        actionSortByDiffPrice()
                    } label: {
                        Text("24h %")
                            .font(.system(size: 11, weight: .regular))
                        Image(systemName: "chevron.down")
                            .resizable()
                            .frame(width: 8, height: 6)
                    } .padding(.leading, 20)
                }
            }.foregroundStyle(.foreground)
        }
    }
}

#Preview {
    //    TopListHeader()
}
