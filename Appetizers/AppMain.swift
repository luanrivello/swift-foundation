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
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabsView().environmentObject(order)
        }
    }
}
