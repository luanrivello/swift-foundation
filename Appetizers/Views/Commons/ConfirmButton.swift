//
//  SwiftUIView.swift
//  Appetizers
//
//  Created by lbr on 06/08/25.
//

import SwiftUI

struct ConfirmButton: View {
    let textString: LocalizedStringKey
    let action: () -> Void 
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(textString)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: 220, height: 40)
        }
        .padding(.bottom, 30)
        .buttonStyle(.borderedProminent)
        .tint(.blue)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmButton(textString: "Test Title", action: {})
    }
}
