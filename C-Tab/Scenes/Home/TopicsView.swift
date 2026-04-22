//
//  TopicsView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

import SwiftUI

struct TopicsView: View {
    var socialImage: String
    var topicTitle: String
    var topicHours: String
    
    var body: some View {
        HStack {
            Image(socialImage)
                .resizable()
                .frame(width: 30, height: 30)
                .cornerRadius(8)
            Text(topicTitle)
            Spacer()
            Text(topicHours)
                .foregroundStyle(.gray)
                .font(.system(size: 13))
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TopicsView(
        socialImage: "x",
        topicTitle: "Justin Sun has field a lawsuit against World Liberty Financial (WLFI).",
        topicHours: "12h"
    )
}
