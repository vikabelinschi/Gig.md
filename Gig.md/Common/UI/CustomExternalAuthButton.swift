//
//  CustomExternalAuthButton.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 28.03.2022.
//

import SwiftUI

struct CustomExternalAuthButton: View {
    var imageName: String
    var buttonText: String
    var buttonColor: Color
    var textColor: Color
    var frameColor: Color
    var body: some View {
        Button(action: {}) {
            Image(imageName)
                .resizable()
                .frame(width: 40, height: 40, alignment: .leading)
                .padding()
            Text(buttonText)
                .fontWeight(.semibold)
                .frame(width: 200, height: 40, alignment: .leading)
        }
        .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 44, alignment: .leading)
        .foregroundColor(textColor)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(frameColor, lineWidth: 2)
        )
        .background(buttonColor)
        .cornerRadius(5)
    }
}

struct CustomExternalAuthButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomExternalAuthButton(imageName: "google", buttonText: "Sign In with Google", buttonColor: .clear, textColor: .black, frameColor: .gray)
    }
}
