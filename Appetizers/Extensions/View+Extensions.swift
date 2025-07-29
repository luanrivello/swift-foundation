//
//  View+Extensions.swift
//  Appetizers
//
//  Created by lbr on 29/07/25.
//

import SwiftUI

extension View {
    func tabItem(icon: String, label: String) -> some View {
        self.tabItem {
            Image(systemName: icon)
            Text(label)
        }
    }
}

