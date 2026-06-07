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
    
    private let appStoreID = "1600000000"
    
    init() {
        getProfile()
    }
    
    func getProfile() {
        profile = Profile(
            avatar: "person.circle.fill", username: "@username",
            email: "email@mail.com"
        )
    }
    
    func openSystemSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }
    
    func openPrivacyPolicy() -> URL {
        URL(string: "https://docs.google.com/document/d/1qp_I6geNaF6RIcooakt0kTp4taXJwX1cM_Va01qy9EY/edit?usp=sharing")!
    }
    
    func rateApp() -> URL {
        URL(string: "https://apps.apple.com/app/id\(appStoreID)?action=write-review")!
    }
}
