//
//  StateView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 21.09.2026.
//

import SwiftUI

enum ViewState {
    case initial
    case loading
    case loaded
    case failure(Error)
    
    var isLoaded: Bool {
        switch self {
        case .loaded: return true
        default: return false
        }
    }
}

struct StateView<Content: View>: View {
    let content: Content
    let state: ViewState
    let retryAction: () async -> Void
    
    var body: some View {
        switch state {
        case .initial, .loading:
            ProgressView()
                .frame(maxWidth: .infinity, alignment: .center)
        case .loaded:
            content
        case .failure:
            ErrorView(onRetry: retryAction)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}
