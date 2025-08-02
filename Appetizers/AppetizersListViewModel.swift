//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by lbr on 02/08/25.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers(completed: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print("AppetizersListView: \(error.localizedDescription)")
                }
            }
        })
    }
}
