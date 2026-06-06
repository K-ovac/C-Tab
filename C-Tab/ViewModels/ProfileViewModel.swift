//
//  ProfileViewModel.swift
//  C-Tab
//
//  Created by Максим Лозебной on 04.06.2026.
//

import SwiftUI
import Combine

final class ProfileViewModel: ObservableObject {
    @Published var profile: Profile?
    @Published var profileSetting: [ProfileSetting] = []
    
    init() {
        getProfile()
    }
    
    func getProfile() {
        profile = Profile(
            avatar: "person.circle.fill", username: "@username",
            email: "email@mail.com"
        )
        
        profileSetting = [
            ProfileSetting(title: "Currency", iconName: "dollarsign.circle", iconColor: .blue),
            ProfileSetting(title: "App Theme", iconName: "lightbulb.min", iconColor: .gray),
            ProfileSetting(title: "Language", iconName: "globe.badge.chevron.backward", iconColor: .red),
        ]
    }
}
