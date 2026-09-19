//
//  CurrencyView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 06.06.2026.
//

import SwiftUI

struct CurrencyView: View {
    @AppStorage(Keys.currency.value)
    private var selectedCurrency: CurrencyPrice = .usd
    
    let title: String
    
    var body: some View {
        List {
            ForEach(CurrencyPrice.allCases) { currency in
                HStack {
                    Image(systemName: currency.icon)
                    Text(currency.id)
                    
                    Spacer()
                    
                    if selectedCurrency == currency {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedCurrency = currency
                }
            }
        }
        .navigationTitle(LocalizedStringKey(title))
        .scrollDisabled(true)
    }
}
