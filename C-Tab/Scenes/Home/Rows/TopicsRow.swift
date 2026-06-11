//
//  TopicsView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

import SwiftUI

struct TopicsRow: View {
    
    let topic: Topic
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.gray)
                .opacity(0.3)
            HStack {
                Image(topic.socialImage)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .cornerRadius(8)
                Text(topic.topicTitle)
                    .font(.system(size: 16, weight: .regular))
                Spacer()
                Text(topic.topicHours)
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
    TopicsRow(
        topic: Topic(
            socialImage: "x",
            topicTitle: "Justin Sun has filed a lawsuit...",
            topicHours: "13h"
        )
    )
}
