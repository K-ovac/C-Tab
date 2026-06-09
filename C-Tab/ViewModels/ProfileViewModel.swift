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
    @Published var profileSettings: [ProfileSetting] = []
    @Published var profileLinks: [ProfileLink] = []
    
    init() {
        getProfile()
    }
    
    func getProfile() {
        profile = Profile(
            avatar: "person.circle.fill", username: "@username",
            email: "email@mail.com"
        )
        
        profileSettings = [
            ProfileSetting(title: "Currency", iconName: "dollarsign.circle", value: "RUB", destination: .currency),
            ProfileSetting(title: "App Theme", iconName: "lightbulb.min", value: AppTheme.dark.id, destination: .appTheme),
        ]
        
        profileLinks = [
            ProfileLink(title: "Language", iconName: "globe.badge.chevron.backward", link: LinksConstants.openSettings),
            ProfileLink(title: "Privacy Policy", iconName: "document", link: LinksConstants.privacyPolicy),
            ProfileLink(title: "Rate Our App", iconName: "hand.thumbsup", link: LinksConstants.rateOurApp)
        ]
    }
}
