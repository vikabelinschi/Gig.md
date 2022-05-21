//
//  LoginView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 22.02.2022.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var signup: Bool = false
    var body: some View {
        if signup {
            SignUpView()
                .transition(.move(edge: .trailing))
        } else {
            NavigationView {
                VStack(spacing: 40) {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .frame(width: 180, height: 60)
                    VStack(alignment: .leading) {
                        CustomTextField(enteredText: username, placeholder: "Enter your email", color: Color("purple-mix"), textColor: Color("purple-mix"))
                        CustomSecureField(enteredText: password, placeholder: "Enter your password", color: Color("purple-mix"), textColor: Color("purple-mix"))
                        VStack(spacing: 20) {
                            CustomButton(buttonText: "Sign In", buttonColor: Color("purple-mix"), textColor: .white)
                            ORView()
                            CustomExternalAuthButton(imageName: "google", buttonText: "Sign In with Google", buttonColor: .clear, textColor: .black, frameColor: .gray)
                            CustomExternalAuthButton(imageName: "fbwww", buttonText: "Sign In with Facebook", buttonColor: Color("fbcolor"), textColor: .white, frameColor: .clear)
                        }
                    }.padding()
                        .frame(width: UIScreen.main.bounds.size.width - 20)
                    Spacer()
                    HStack {
                        Text("Don't have an account?")
                        Button {
                            withAnimation {
                                self.signup.toggle()
                            }
                        } label: {
                            Text("Sign Up")
                                .foregroundColor(Color("purple-mix"))
                        }
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
            .background(.white)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
