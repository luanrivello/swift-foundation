//
//  XButton.swift
//  Appetizers
//
//  Created by lbr on 06/08/25.
//

import SwiftUI

struct XCloseButton: View {
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack {
                Circle().foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .opacity(0.7)
                Image(systemName: "xmark")
                    .foregroundColor(.black)
            }
            .padding(10)
        }
    }
}

struct XButton_Previews: PreviewProvider {
    static var previews: some View {
        XCloseButton(action: {})
    }
}
