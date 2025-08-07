//
//  Appetizer.swift
//  Appetizers
//
//  Created by lbr on 29/07/25.
//

import Foundation

struct Appetizer: Identifiable, Decodable {
    //var udid =          UUID()
    let id:             Int
    let name:           String
    let description:    String
    let imageURL:       String
    let price:          Double
    let calories:       Int
    let protein:        Int
    let carbs:          Int
}

struct AppetizersResponse: Decodable {
    let appetizers:  [Appetizer]
}
