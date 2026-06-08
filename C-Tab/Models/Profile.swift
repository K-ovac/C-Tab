//
//  Profile.swift
//  C-Tab
//
//  Created by Максим Лозебной on 04.06.2026.
//

import SwiftUI

struct Profile {
    let avatar: String
    let username: String
    let email: String
}

struct ProfileSetting: Identifiable {
    let id = UUID()
    let title: String
    let iconName: String
    let destination: SettingsDestination
}

enum SettingsDestination {
    case language, appTheme, currency
}

struct ProfileLink: Identifiable {
    let id = UUID()
    let title: String
    let iconName: String
    let link: URL
}
