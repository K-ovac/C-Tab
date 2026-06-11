//
//  TopicsHeader.swift
//  C-Tab
//
//  Created by Максим Лозебной on 24.04.2026.
//

import SwiftUI

struct TopicsHeader: View {
    let action: () -> Void
    
    var body: some View {
        HStack {
            Text("Topics")
            Spacer()
            Button {
                action()
            } label: {
                HStack {
                    Text("See more")
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 10, height: 10)
                }
            }
        }
    }
}

#Preview {
//    TopicsHeader()
}
