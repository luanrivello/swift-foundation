//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by lbr on 29/07/25.
//

import SwiftUI

struct AppetizersListView: View {
    var body: some View {
        NavigationView(){
            List {
                AppetizerCell()
                AppetizerCell()
                AppetizerCell()
                AppetizerCell()
                AppetizerCell()
            }.navigationTitle("Appetizers")
        }
    }
}

struct AppetizerCell: View {
    var body: some View {
        HStack {
            Image(systemName: "fork.knife")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            VStack (alignment: .leading){
                Text("Name").bold()
                Text("Description")
            }.padding()
        }
    }
}

struct AppetizersListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersListView()
    }
}
