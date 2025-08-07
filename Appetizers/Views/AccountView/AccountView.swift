//
//  AccountView.swift
//  Appetizers
//
//  Created by lbr on 29/07/25.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView(){
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                .tint(.blue)
                
                Section(header: Text("Special Conditions")) {
                    Toggle("Lactose Intolerance", isOn: $viewModel.user.isLactoseIntolerant)
                    Toggle("Ciliac Disease", isOn: $viewModel.user.isCiliac)
                    Toggle("Diabetic", isOn: $viewModel.user.isDiabetic)
                }
                .toggleStyle(SwitchToggleStyle(tint: .blue))
            }
            .navigationTitle("Account")
        }
        .onAppear {
            viewModel.retriveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
