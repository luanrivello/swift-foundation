//
//  ContentView.swift
//  Appetizers
//
//  Created by lbr on 29/07/25.
//

import SwiftUI

struct AppetizerTabsView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem(icon: "house.fill",
                         label: "Home")
            
            AppetizersListView()
                .tabItem(icon: "fork.knife",
                         label: "List")
            
            OrderView()
                .tabItem(icon: "bag.fill",
                         label: "Order")
                .badge(order.items.count)
            
            AccountView()
                .tabItem(icon: "person.fill",
                         label: "Account")
        }
        .accentColor(.brandPrimary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabsView()
    }
}
