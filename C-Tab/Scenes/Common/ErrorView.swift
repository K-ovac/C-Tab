//
//  ErrorView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 21.09.2026.
//

import SwiftUI

struct ErrorView: View {
    let onRetry: () -> Void
    
    var body: some View {
        LazyVStack {
            Text("error.load.title")
            Button {
                onRetry()
            } label: {
                Text("error.button.retry.title")
                    .font(.body)
                    .foregroundStyle(.primary)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .foregroundStyle(.primary)
            .background(.gray.opacity(0.4))
            .clipShape(.buttonBorder)
        }
    }
}
