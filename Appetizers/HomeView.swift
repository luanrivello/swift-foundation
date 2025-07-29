//
//  HomeView.swift
//  Appetizers
//
//  Created by lbr on 29/07/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 50) {
            Image(systemName: "globe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.accentColor)
                .padding(100)
            Text("Hello, world!").bold().font(.title)
        }.padding(.bottom, 50)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
