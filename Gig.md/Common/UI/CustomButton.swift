//
//  CustomButton.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 31.03.2022.
//

import SwiftUI

struct CustomButton: View {
    var buttonText: String
    var buttonColor: Color
    var textColor: Color
    var body: some View {
        Button(action: {}) {
            Text(buttonText)
                .fontWeight(.semibold)
                .foregroundColor(textColor)
                .cornerRadius(5)
        }
        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44)
        .background(buttonColor)
        .cornerRadius(5)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(buttonText: "Sign In", buttonColor: .blue, textColor: .white)
    }
}
