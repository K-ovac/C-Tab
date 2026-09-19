//
//  DescriptionView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 15.09.2026.
//

import SwiftUI

struct DescriptionView: View {
    let title: String
    let text: String
    let onClose: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.primary)
                .font(.title)
                .padding(.bottom)
            
            Text(text)
                .foregroundStyle(.primary)
                .font(.body)
                .padding(.bottom)
            
            Button {
                onClose()
            } label: {
                Text("description.closeButton.title")
                    .font(.body.bold())
                    .padding(.horizontal)
                    .padding(.vertical, 8)
            }
            .foregroundStyle(.primary)
            .background(.secondary.opacity(0.1))
            .clipShape(.buttonBorder)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .multilineTextAlignment(.leading)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        
        .padding()
    }
}
