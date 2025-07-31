//
//  NetworkManager.swift
//  Appetizers
//
//  Created by lbr on 30/07/25.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseURL = "http://localhost"
    static let appetizersEndPoint = "/appetizers"
    
    private init () {
        
    }
    
}
