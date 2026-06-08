//
//  SearchView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 23.04.2026.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    let topics = ["BTC", "ergrt", "урыга"]
    var body: some View {
        NavigationStack {
            ZStack {
                List(filteredTopics, id: \.self) { topic in
                    Text(topic)
                }.listStyle(.grouped)
                    .navigationTitle("Search")
                    .navigationBarTitleDisplayMode(.inline)
                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            }
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

extension SearchView {
    var filteredTopics: [String] {
        if searchText.isEmpty {
            return topics
        } else {
            return topics.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

#Preview {
    SearchView()
}
