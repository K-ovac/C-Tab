//
//  CoinDetailsViewModel.swift
//  C-Tab
//
//  Created by Максим Лозебной on 12.09.2026.
//

import Foundation
import Combine

final class CoinDetailsViewModel: ObservableObject {
    
    @Published var coinDetails: CoinMetadata?
    
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
    
    func fetchCoinDetails() {
        coinDetailsServise.fetchCoinDetails(for: coinId) { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.coinDetails = data
                    print(data)
                case .failure(let error):
                    print(error)
                    break
                }
            }
        }
    }
}
