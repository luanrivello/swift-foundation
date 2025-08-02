//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by lbr on 29/07/25.
//

import SwiftUI

struct AppetizersListView: View {
    @State var appetizers: [Appetizer] = []
    
    var body: some View {
        NavigationView(){
            List (appetizers, id: \.id) { appetizer in
                AppetizerCell(appetizer: appetizer)
            }
            .navigationTitle("Appetizers")
        }
        .onAppear(perform: getAppetizers)
    }
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers(completed: { result in
            switch result {
            case .success(let appetizers):
                self.appetizers = appetizers
            case .failure(let error):
                print("AppetizersListView: \(error.localizedDescription)")
            }
        })
    }
}

struct NoConnectionView: View {
    var body: some View {
        VStack(spacing: 50) {
            Image(systemName: "globe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.accentColor)
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
                .foregroundColor(.accentColor)
            
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
