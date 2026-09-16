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
    
    private var storage = UserDefaultsService.shared
    
    var selectedCurrency: String {
        get { storage.currentCurrency }
    }
    var selectedTheme: String {
        get { storage.currentTheme }
    }
    
    var selectedLanguage: String {
        get { storage.currentLanguage }
    }
    
    init() {
        getProfile()
    }
    
    func getProfile() {
        profile = Profile(
            avatar: "person.circle.fill",
            username: "@username",
            email: "email@mail.com"
        )
        
        profileSettings = [
            ProfileSetting(title: "Currency", iconName: "dollarsign.circle", value: selectedCurrency, destination: .currency),
            ProfileSetting(title: "App Theme", iconName: "lightbulb.min", value: selectedTheme, destination: .appTheme),
            ProfileSetting(title: "Language", iconName: "translate", value: selectedLanguage, destination: .language),
        ]
        
        profileLinks = [
            ProfileLink(title: "Privacy Policy", iconName: "document", link: LinksConstants.privacyPolicy),
            ProfileLink(title: "Rate Our App", iconName: "hand.thumbsup", link: LinksConstants.rateOurApp)
        ]
    }
}
