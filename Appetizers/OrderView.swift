//
//  OrderView.swift
//  Appetizers
//
//  Created by lbr on 29/07/25.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationView(){
            List {
                OrderCell()
            }.navigationTitle("Order")
        }
    }
}

struct OrderCell: View {
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "fork.knife")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Name").bold()
            
            Spacer()
            
            Text("99.99 R$")
        }.padding()
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
