//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by lbr on 02/08/25.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var isLoading = true
    @Published var alertItem: AlertItem?
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    self.alertItem = self.getAlertItem(for: error)
                }
            }
        }
    }

    private func getAlertItem(for error: APIError) -> AlertItem {
        switch error {
        case .invalidURL:         return AlertContext.invalidURL
        case .invalidResponse:    return AlertContext.invalidResponse
        case .invalidData:        return AlertContext.invalidData
        case .unableToComplete:   return AlertContext.unableToComplete
        case .requestTimeout:     return AlertContext.requestTimeout
        case .invalidJson:        return AlertContext.invalidJson
        }
    }

}
