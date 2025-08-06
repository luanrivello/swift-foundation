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
        ZStack {
            NavigationView(){
                List (viewModel.appetizers, id: \.id) { appetizer in
                    AppetizerCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetails = true
                        }
                }
                .navigationTitle("Appetizers")
                .disabled(viewModel.isShowingDetails)
            }
            .onAppear(perform: viewModel.getAppetizers)
            .blur(radius: viewModel.isShowingDetails ? 20 : 0)
            
            if viewModel.isShowingDetails {
                AppetizersDetailsView(
                    selectedAppetizer: viewModel.selectedAppetizer!,
                    isShowingDetails: $viewModel.isShowingDetails
                )
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title:            alertItem.title,
                  message:          alertItem.message,
                  dismissButton:    alertItem.dismissButton)
        }
    }
}

struct AppetizerCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .cornerRadius(16)
            
            VStack (alignment: .leading, spacing: 5){
                Text(appetizer.name).bold()
                    .font(.title3)
                    .fontWeight(.medium)
                
                Text("R$ \(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.medium)
            }
            .padding(.leading)
        }
    }
}

struct AppetizersListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersListView()
    }
}
