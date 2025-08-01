//
//  APIError.swift
//  Appetizers
//
//  Created by lbr on 01/08/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    case requestTimeout
    case invalidJson
}
