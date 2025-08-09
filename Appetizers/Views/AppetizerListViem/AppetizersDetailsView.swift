//
//  AppetizersDetailsView.swift
//  Appetizers
//
//  Created by lbr on 06/08/25.
//

import SwiftUI

struct AppetizersDetailsView: View {
    @EnvironmentObject var order: Order
    
    var selectedAppetizer: Appetizer
    @Binding var isShowingDetails: Bool
    
    var body: some View {
        
        VStack {
            AppetizerRemoteImage(urlString: selectedAppetizer.imageURL)
                .scaledToFill()
                .frame(height: 220)
                .clipped()
            
            AppetizersTextDetails(appetizer: selectedAppetizer)
                .padding(12)
        
            AppetizersNutrientsDetails(appetizer: selectedAppetizer)
                .padding()
            
            Spacer()
            
            ConfirmButton(
                textString: "Add to Order - R$\(selectedAppetizer.price, specifier: "%.2f")",
                action: {
                    order.add(selectedAppetizer)
                    isShowingDetails = false
                }
            )
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(32)
        .shadow(radius: 40)
        .overlay(
            XCloseButton(action: {
                isShowingDetails = false
            }), alignment: .topTrailing
        )
    }
}

struct AppetizersTextDetails: View {
    let appetizer: Appetizer
    
    var body: some View {
        VStack(spacing: 10) {
            Text(appetizer.name)
                .font(.title3)
                .bold()
            
            Text(appetizer.description)
                .font(.subheadline)
                .multilineTextAlignment(.center)
        }
    }
}

struct AppetizersNutrientsDetails: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack(spacing: 32) {
            NutrientItem(title: "Calories", value: "\(appetizer.calories)")
            NutrientItem(title: "Carbs", value: "\(appetizer.carbs) g")
            NutrientItem(title: "Proteins", value: "\(appetizer.protein) g")
        }
    }
}

struct NutrientItem: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.subheadline)
                .bold()
            Text(value)
                .font(.subheadline)
        }
    }
}

struct AppetizersDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersDetailsView(
            selectedAppetizer: MockData.appetizerItemOne,
            isShowingDetails: .constant(true)
        )
    }
}
