//
//  StartScreenRow.swift
//  C-Tab
//
//  Created by Максим Лозебной on 04.06.2026.
//

import SwiftUI

struct StartScreenRow: View {
    @Environment(\.dismiss) var dismiss
    
    let items = [StartScreen(title: "Markets"), StartScreen(title: "Portfolio"), StartScreen(title: "Watchlist")]
    var body: some View {
        NavigationStack {
            List {
                //                ForEach(items) { item in
                //                    Text(item.title)
                //                }
            }
            .navigationTitle("Start Screen")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

#Preview {
    StartScreenRow()
}
