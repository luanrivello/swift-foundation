//
//  AccountView.swift
//  Appetizers
//
//  Created by lbr on 29/07/25.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView(){
            Text("Account View")
                .navigationTitle("Appetizers")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
