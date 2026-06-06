//
//  ProfileRow.swift
//  C-Tab
//
//  Created by Максим Лозебной on 06.06.2026.
//

import SwiftUI

struct ProfileRow: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundStyle(.gray)
            VStack(alignment: .leading, spacing: 3) {
                Text("@username")
                    .font(.headline)
                Text("email@mail.com")
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    ProfileRow()
}
