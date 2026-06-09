//
//  LinkConstants.swift
//  C-Tab
//
//  Created by Максим Лозебной on 09.06.2026.
//

import UIKit

enum LinksConstants {
    private static let appStoreID = "1600000000"
    
    static let rateOurApp = URL.make("https://apps.apple.com/app/id\(appStoreID)?action=write-review")
    
    static let privacyPolicy = URL.make("https://docs.google.com/document/d/1qp_I6geNaF6RIcooakt0kTp4taXJwX1cM_Va01qy9EY/edit?usp=sharing")
    
    static let openSettings = URL.make(UIApplication.openSettingsURLString)
}

extension URL {
    static func make(_ url: String) -> URL {
        if let url = URL(string: url) {
            return url
        } else {
            fatalError("Incorrect URL" + url)
        }
    }
}
