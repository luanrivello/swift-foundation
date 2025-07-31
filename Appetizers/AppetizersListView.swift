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
            List (MockData.appetizers, id: \.id) { appetizer in
                AppetizerCell(appetizer: appetizer)
            }
            .navigationTitle("Appetizers")
        }
    }
}

struct AppetizerCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            Image(systemName: "fork.knife")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            VStack (alignment: .leading, spacing: 5){
                Text(appetizer.name).bold()
                Text("R$ \(appetizer.price, specifier: "%.2f")")
                Text("\(appetizer.id)")
                    .font(.caption2)
                    .lineLimit(1)
                    .truncationMode(.middle)
            }.padding()
        }
    }
}

struct AppetizersListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersListView()
    }
}
