//
//  AppThemeView.swift
//  C-Tab
//
//  Created by Максим Лозебной on 06.06.2026.
//

import SwiftUI

struct AppThemeView: View {
    var body: some View {
        VStack {
            List {
                Text("Light")
                Text("Dark")
                Text("Follow device setting")
            }
            .navigationTitle("Theme")
        }
    }
}

#Preview {
    AppThemeView()
}
