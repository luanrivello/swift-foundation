//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by lbr on 07/08/25.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let dataToSave = try JSONEncoder().encode(user)
            userData = dataToSave
        } catch {
            alertItem = AlertItem(title: Text("Profile Error"),
                                  message: Text("There was an error saving your profile information"),
                                  dismissButton: .default(Text("OK")))
            print("Changes have been saved successfully")
        }
        
        alertItem = AlertItem(title: Text("Profile Saved"),
                              message: Text("Your profile information was successfully saved"),
                              dismissButton: .default(Text("OK")))
        print("Changes have been saved successfully")
    }
    
    func retriveUser() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertItem(title: Text("Profile Error"),
                                  message: Text("There was an error retriving your profile information"),
                                  dismissButton: .default(Text("OK")))
        }
        
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertItem(title: Text("Invalid Form"),
                                  message: Text("Plese ensure all field in the form have been filledout"),
                                  dismissButton: .default(Text("OK")))
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertItem(title: Text("Invalid Email"),
                                  message: Text("Plese ensure your email is correct"),
                                  dismissButton: .default(Text("OK")))
            return false
        }
        
        return true
    }
    
}
