//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by lbr on 29/07/25.
//

import SwiftUI

struct AppetizersListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationView(){
            List (viewModel.appetizers, id: \.id) { appetizer in
                AppetizerCell(appetizer: appetizer)
            }
            .navigationTitle("Appetizers")
        }
        .onAppear(perform: viewModel.getAppetizers)
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct NoConnectionView: View {
    var body: some View {
        VStack(spacing: 50) {
            Image(systemName: "globe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.primaryColor)
                .padding(100)
            Text("Loading...").bold().font(.title)
        }.padding(.bottom, 50)
    }
}

struct AppetizerCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            Image(systemName: "fork.knife")
                .imageScale(.large)
                .foregroundColor(.primaryColor)
            
            VStack (alignment: .leading, spacing: 5){
                Text(appetizer.name).bold()
                Text("R$ \(appetizer.price, specifier: "%.2f")")
            }.padding()
        }
    }
}

struct AppetizersListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersListView()
    }
}
