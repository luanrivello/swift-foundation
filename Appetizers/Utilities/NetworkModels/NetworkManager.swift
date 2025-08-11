//
//  NetworkManager.swift
//  Appetizers
//
//  Created by lbr on 01/08/25.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "http://localhost:8080/"
    private let appetizersPath = "appetizers/"
    static private let cache = NSCache<NSString, UIImage>()
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APIError>) -> Void) {
        guard let appetizersURL = URL(string: baseURL + appetizersPath) else {
            loggerNetworkManager.error("NetworkManager [Error]: \(APIError.invalidURL.localizedDescription, privacy: .public)")
            completed(.failure(.invalidURL))
            return
        }
        
        let request = URLRequest(url: appetizersURL, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 30)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error as? URLError, error.code == .timedOut {
                self.handleNetworkManagerError(errorOfType: .requestTimeout)
                completed(.failure(.requestTimeout))
                return
            }
            
            if let _ = error {
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
                completed(.success(decodedData.appetizers))
            } catch {
                self.handleNetworkManagerError(errorOfType: .invalidJson)
                let dataString = String(data: data, encoding: .utf8) ?? "Unable to convert data to string"
                loggerNetworkManager.error("Failed to decode JSON: \(dataString, privacy: .public)")
                completed(.failure(.invalidJson))
            }
        }

        task.resume()
    }
    
    private func handleNetworkManagerError(errorOfType: APIError) {
        loggerNetworkManager.error("NetworkManager [Error]: \(errorOfType.localizedDescription, privacy: .public)")
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        if let image = NetworkManager.cache.object(forKey: cacheKey) {
            loggerNetworkManager.log("\(urlString, privacy: .public): cached image found.")
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            loggerNetworkManager.error("\(urlString, privacy: .public): invalid url!")
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            loggerNetworkManager.log("\(urlString, privacy: .public): request done.")
            
            guard let data = data, let image = UIImage(data: data) else {
                loggerNetworkManager.error("\(urlString, privacy: .public): no data or failed to create image!")
                completed(nil)
                return
            }
            
            loggerNetworkManager.log("\(urlString, privacy: .public): set cached image")
            NetworkManager.cache.setObject(image, forKey: cacheKey)
            
            completed(image)
        }
        
        task.resume()
    }
}
