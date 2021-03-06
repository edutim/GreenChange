//
//  GreenChangeApp.swift
//  GreenChange
//
//  Created by Timothy Hart on 2021-08-31.
//

import SwiftUI

@main
struct GreenChangeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(WalletViewModel.shared)
                .environmentObject(ChallengesViewModel.shared)
                .environmentObject(EventsViewModel.shared)
        }
    }
}
