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

struct MockData {
    static let appetizerItemOne     = Appetizer(
                                            id: 1,
                                            name: "Test Appetizer One",
                                            description: "This is the description for my appetizer. It's yummy.",
                                            imageURL: "",
                                            price: 9.91,
                                            calories: 91,
                                            protein: 92,
                                            carbs: 93
                                        )
    
    static let appetizerItemTwo     = Appetizer(
                                            id: 2,
                                            name: "Test Appetizer Two",
                                            description: "This is the description for my appetizer. It's yummy.",
                                            imageURL: "",
                                            price: 9.92,
                                            calories: 92,
                                            protein: 93,
                                            carbs: 94
                                        )
    
    static let appetizerItemThree   = Appetizer(
                                            id: 3,
                                            name: "Test Appetizer Three",
                                            description: "This is the description for my appetizer. It's yummy.",
                                            imageURL: "",
                                            price: 9.93,
                                            calories: 93,
                                            protein: 94,
                                            carbs: 95
                                        )
    
    static let appetizers       = [appetizerItemOne, appetizerItemTwo, appetizerItemThree]
    
    static let orderItems       = [appetizerItemOne, appetizerItemTwo, appetizerItemThree]
}
