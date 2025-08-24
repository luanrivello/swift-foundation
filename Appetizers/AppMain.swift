//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by lbr on 29/07/25.
//

import SwiftUI

@main
struct AppMain: App {
    var order = Order()
    
    init() {
        if CommandLine.arguments.contains("UITest_ResetUserDefaults") {
            let domain = Bundle.main.bundleIdentifier!
            UserDefaults.standard.removePersistentDomain(forName: domain)
            UserDefaults.standard.synchronize()
            print("UI Test: Cleared UserDefaults")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabsView().environmentObject(order)
        }
    }
}
