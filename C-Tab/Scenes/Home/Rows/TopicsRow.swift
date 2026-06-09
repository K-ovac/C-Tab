//
//  TopicsView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

import SwiftUI

struct TopicsRow: View {
    
    let iconTopic: String
    let title: String
    let hours: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.gray)
                .opacity(0.3)
            HStack {
                Image(iconTopic)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .cornerRadius(8)
                Text(title)
                    .font(.system(size: 16, weight: .regular))
                Spacer()
                Text(hours)
                    .foregroundStyle(.secondary)
                    .opacity(0.9)
                    .font(.system(size: 13))
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 5)
        } .frame(maxHeight: .infinity)
            .cornerRadius(8)
    }
}

#Preview {
    TopicsRow(iconTopic: "x", title: "Justin Sun has filed a lawsuit...", hours: "13h")
}
