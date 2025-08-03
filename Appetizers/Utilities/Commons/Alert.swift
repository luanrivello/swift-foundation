//
//  Alert.swift
//  Appetizers
//
//  Created by lbr on 02/08/25.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id =            UUID()
    let title:          Text
    let message:        Text
    let dismissButton:  Alert.Button
}

struct AlertContext {
    static let invalidData      = AlertItem(title:         Text("Server Error"),
                                            message:       Text("The data received from the server was invalid. Please contact support."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidResponse  = AlertItem(title:         Text("Server Error"),
                                            message:       Text("The response received from the server was invalid. Please contact support."),
                                            dismissButton: .default(Text("Ok")))
   
    static let invalidURL       = AlertItem(title:         Text("Server Error"),
                                            message:       Text("There was an issue connecting to thhe server. If this persists, please contact support."),
                                            dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title:         Text("Server Error"),
                                            message:       Text("Unable to complete your request at this time. Please check your internet connection."),
                                            dismissButton: .default(Text("Ok")))
    
    static let requestTimeout   = AlertItem(title:         Text("Server Error"),
                                            message:       Text("There was an issue connecting to the server. Please try again later."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidJson      = AlertItem(title:         Text("Server Error"),
                                            message:       Text("The data information received from the server was invalid. Please contact support."),
                                            dismissButton: .default(Text("Ok")))
    
}
