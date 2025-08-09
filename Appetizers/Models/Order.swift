//
//  OrderViewModel.swift
//  Appetizers
//
//  Created by lbr on 09/08/25.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func remove(at offesets: IndexSet) {
        items.remove(atOffsets: offesets)
    }
    
}
