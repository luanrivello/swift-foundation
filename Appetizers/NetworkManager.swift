//
//  NetworkManager.swift
//  Appetizers
//
//  Created by lbr on 01/08/25.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "https://localhost/"
    private let appetizersPath = "appetizers/"
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APIError>) -> Void) {
        guard let appetizersURL = URL(string: baseURL + appetizersPath) else {
            print("NetworkManager Error: \(APIError.invalidURL)")
            completed(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: appetizersURL, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 30)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error as? URLError, error.code == .timedOut {
                self.handleNetworkManagerError(errorOfType: .requestTimeout)
                completed(.failure(.requestTimeout))
                return
            }
            
            if let error = error {
                self.handleNetworkManagerError(errorOfType: .unableToComplete)
                completed(.failure(.unableToComplete))
                return
            }

            guard let response =
                    response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                self.handleNetworkManagerError(errorOfType: .invalidResponse)
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                self.handleNetworkManagerError(errorOfType: .invalidData)
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(AppetizersResponse.self, from: data)
                completed(.success(decodedData.appetizersList))
            } catch {
                self.handleNetworkManagerError(errorOfType: .invalidJson)
                completed(.failure(.invalidJson))
            }
        }

        task.resume()
    }
    
    private func handleNetworkManagerError(errorOfType: APIError) {
        print("NetworkManager Error: \(errorOfType)")
    }
}
