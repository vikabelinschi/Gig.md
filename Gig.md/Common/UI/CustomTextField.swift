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
    var body: some View {
        VStack(spacing: 4) {
            TextField(placeholder, text: $enteredText)
                .foregroundColor(.black)
        Color.blue.frame(height:CGFloat(3) / UIScreen.main.scale)
            .padding(.bottom)
        }
    }
}

struct CustomSecureField: View {
    @State var enteredText: String = ""
    var placeholder: String
    var body: some View {
        VStack(spacing: 4) {
            SecureField(placeholder, text: $enteredText)
                .foregroundColor(.black)
        Color.blue.frame(height:CGFloat(3) / UIScreen.main.scale)
            .padding(.bottom)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeholder: "Enter your email")
    }
}
