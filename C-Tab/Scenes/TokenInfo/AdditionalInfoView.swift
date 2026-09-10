//
//  AdditionalInfoView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 10.09.2026.
//

import SwiftUI

struct AdditionalInfoView: View {
    private let links: [String] = [
        "Website",
        "Explorer",
        "Code & Community"
    ]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ForEach(links, id: \.self) {
                    Text($0)
                }
            }
            .foregroundStyle(.secondary)
            
            Spacer()
            
            
            
        }
        .font(.headline)
    }
}

#Preview {
    AdditionalInfoView()
}
