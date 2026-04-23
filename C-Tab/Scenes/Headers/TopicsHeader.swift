//
//  TopicsHeader.swift
//  C-Tab
//
//  Created by Максим Лозебной on 24.04.2026.
//

import SwiftUI

struct TopicsHeader: View {
    var body: some View {
        HStack {
            Text("Topics")
            Spacer()
            Button {
                
            } label: {
                HStack {
                    Text("See more")
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 10, height: 12)
                }
            }
        }
    }
}

#Preview {
    TopicsHeader()
}
