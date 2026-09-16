//
//  LanguageView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 15.09.2026.
//

import SwiftUI

struct LanguageView: View {
    @AppStorage(Keys.language.value)
    private var selectedLanguage: Language = .en
    
    let title: String
    
    var body: some View {
        List {
            ForEach(Language.allCases) { lang in
                HStack {
                    Image(lang.icon)
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text(lang.id)
                        .foregroundStyle(.primary)
                        .font(.body)
                    
                    Spacer()
                    
                    if selectedLanguage == lang {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    
                    selectedLanguage = lang
                    
                }
            }
        }
        .navigationTitle(title)
        .scrollDisabled(true)
    }
}

#Preview {
    LanguageView(title: "Language")
}
