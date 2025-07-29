//
//  ContentView.swift
//  Appetizers
//
//  Created by lbr on 29/07/25.
//

import SwiftUI

struct AppetizerTabsView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem(icon: "house.circle",
                         label: "Home")
            
            AppetizersListView()
                .tabItem(icon: "fork.knife.circle",
                         label: "List")
            
            OrderView()
                .tabItem(icon: "dollarsign.circle",
                         label: "Order")
            
            AccountView()
                .tabItem(icon: "person.crop.circle",
                         label: "Account")
        }
        .accentColor(Color("primaryColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabsView()
    }
}
