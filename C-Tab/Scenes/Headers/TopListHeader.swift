//
//  TopListHeader.swift
//  C-Tab
//
//  Created by Максим Лозебной on 24.04.2026.
//

import SwiftUI

struct TopListHeader: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundStyle(.gray)
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
                    
                    Button {
                        //
                    } label: {
                        Text("24h %")
                            .foregroundStyle(.white)
                            .font(.system(size: 14, weight: .regular))
                    }
                }
            }
            
            HStack {
                Button {
                    //
                } label: {
                    Text("Asset/M.Cap")
                        .font(.system(size: 11, weight: .regular))
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 8, height: 6)
                }
                Spacer()
                
                Button {
                    //
                } label: {
                    Text("Price")
                        .font(.system(size: 11, weight: .regular))
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 8, height: 6)
                }
                Spacer()
                
                Button {
                    //
                } label: {
                    Text("24h %")
                        .font(.system(size: 11, weight: .regular))
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 8, height: 6)
                }
            } .foregroundStyle(.black)
        }
    }
}

#Preview {
    TopListHeader()
}
