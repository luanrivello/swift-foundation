//
//  OrderView.swift
//  Appetizers
//
//  Created by lbr on 29/07/25.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView(){
            ZStack {
                VStack{
                    List {
                        ForEach (order.items, id: \.id) { appetizer in
                            OrderCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.remove)
                    }
                    .listStyle(.grouped)
                    
                    Text("Total: R$\(order.totalPrice, specifier: "%.2f")")
                        .font(.body)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                        .padding(.trailing, 30)
                
                    ConfirmButton(textString: "Place Order", action: {
                        print("Ordered Placed!")
                    })
                }
                
                if order.items.isEmpty {
                    EmptyList()
                }
            }
            .navigationTitle("Order")
        }
    }
}

struct OrderCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .cornerRadius(16)
            
            VStack (alignment: .leading, spacing: 5){
                Text(appetizer.name).bold()
                    .font(.title3)
                    .fontWeight(.medium)
                
                Text("R$ \(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.medium)
            }
            .padding(.leading)
        }
    }
}

struct EmptyList: View {
    
    var body: some View {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(systemName: "cart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.brandPrimary)
                    .frame(height: 150)
                    .padding()
                
                Text("You have no items in your order. \nPlease add an appetizer!")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -40)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
