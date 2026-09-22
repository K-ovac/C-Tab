//
//  CoinDetailsViewModel.swift
//  C-Tab
//
//  Created by Максим Лозебной on 12.09.2026.
//

import Foundation
import Combine


@MainActor
final class CoinDetailsViewModel: ObservableObject {
    
    @Published var coinDetails: CoinMetadata?
    @Published var coinDetailsState: ViewState = .initial
    
    private var coinDetailsServise: CoinDetailsService
    private let coinId: String
    private var storage = UserDefaultsService.shared
    
    var selectedCurrency: String {
        get { storage.currentCurrency }
    }
    
    init(coinDetailsServise: CoinDetailsService, coinId: String) {
        self.coinDetailsServise = coinDetailsServise
        self.coinId = coinId
    }
    
    func fetchCoinDetails() async {
        coinDetailsState = .loading
        
        do {
            coinDetails = try await coinDetailsServise.fetchCoinDetails(for: coinId)
            coinDetailsState = .loaded
        } catch {
            coinDetailsState = .failure(error)
        }
    }
}
