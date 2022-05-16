//
//  CustomTextField.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 28.03.2022.
//

import SwiftUI

struct CustomTextField: View {
    @State var enteredText: String = ""
    var placeholder: String
    var color: Color
    var textColor: Color
    var body: some View {
        VStack(spacing: 4) {
            TextField(placeholder, text: $enteredText)
                .foregroundColor(textColor)
        color.frame(height:CGFloat(3) / UIScreen.main.scale)
            .padding(.bottom)
        }
    }
}

struct CustomSecureField: View {
    @State var enteredText: String = ""
    var placeholder: String
    var color: Color
    var textColor: Color
    var body: some View {
        VStack(spacing: 4) {
            SecureField(placeholder, text: $enteredText)
                .foregroundColor(textColor)
        color.frame(height:CGFloat(3) / UIScreen.main.scale)
            .padding(.bottom)
        }
    }
}

struct CustomPhoneField: View {
    @State var enteredText: String = ""
    var placeholder: String
    var color: Color
    var textColor: Color
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text("+373")
                    .foregroundColor(color)
                    .font(.system(size: 16))
            TextField(placeholder, text: $enteredText)
                .foregroundColor(textColor)
            }
        color.frame(height:CGFloat(3) / UIScreen.main.scale)
            .padding(.bottom)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomPhoneField(placeholder: "123456", color: .black, textColor: .blue)
    }
}
