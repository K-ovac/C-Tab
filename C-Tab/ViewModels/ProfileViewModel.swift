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
    
    private let appStoreID = "1600000000"
    
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
            ProfileSetting(title: "App Theme", iconName: "lightbulb.min", value: nil, destination: .appTheme),
        ]
        
        profileLinks = [
            ProfileLink(title: "Language", iconName: "globe.badge.chevron.backward", link: URL(string: UIApplication.openSettingsURLString)!),
            ProfileLink(title: "Privacy Policy", iconName: "document", link: URL(string: "https://docs.google.com/document/d/1qp_I6geNaF6RIcooakt0kTp4taXJwX1cM_Va01qy9EY/edit?usp=sharing")!),
            ProfileLink(title: "Rate Our App", iconName: "hand.thumbsup", link: URL(string: "https://apps.apple.com/app/id\(appStoreID)?action=write-review")!)
        ]
    }
}
