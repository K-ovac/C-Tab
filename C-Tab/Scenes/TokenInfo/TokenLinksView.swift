//
//  AdditionalInfoView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 10.09.2026.
//

import SwiftUI

struct TokenLinksView: View {
    private let links: [CoinLinks] = [
        CoinLinks(image: Image("x"), title: "X"),
        CoinLinks(image: Image("github"), title: "GitHub"),
        CoinLinks(image: Image(systemName: "menubar.dock.rectangle"), title: "Website"),
        CoinLinks(image: Image(systemName: "globe"), title: "Block Reviewer"),
    ]
    
    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.adaptive(minimum: 100))
            ],
        ) {
            ForEach(links, id: \.title) { link in
                Button {
                    print(link.title + " pressed")
                } label: {
                    HStack {
                        link.image
                            .resizable()
                            .frame(width: 22, height: 22)
                        Text(link.title)
                            .foregroundStyle(.primary)
                            .font(.body.bold())
                            
                    }
                }
                .buttonStyle(.bordered)
                .foregroundStyle(.primary)
            }
        }
    }
}

#Preview {
    TokenLinksView()
}
