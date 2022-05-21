//
//  SignUpView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 22.02.2022.
//

import SwiftUI

struct SignUpView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var repeatPassword: String = ""
    @State var checked: Bool = false
    @State var continues: Bool = false
    @State var signin: Bool = false
    var body: some View {
        if signin {
            LoginView()
                .transition(.move(edge: .trailing))
        } else if continues {
            UserDetailsView()
        } else {
            NavigationView {
                VStack(spacing: 40) {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .frame(width: 180, height: 60)
                    VStack(alignment: .leading) {
                        CustomTextField(enteredText: username, placeholder: "Enter a valid email", color: Color("darkPink"), textColor: Color("purple-mix"))
                        CustomSecureField(enteredText: password, placeholder: "Enter a password",color: Color("darkPink"), textColor: Color("purple-mix"))
                        CustomSecureField(enteredText: repeatPassword, placeholder: "Enter the same password", color: Color("darkPink"), textColor: Color("darkPink"))
                        Toggle("I agree to the Gig.md User Agreement and Privacy Policy", isOn: $checked)
                            .toggleStyle(CheckboxToggleStyle(style: .square))
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                        VStack(spacing: 20) {
                                CustomButton(buttonText: "Continue", buttonColor: Color("purple-mix"), textColor: .white) {
                                    self.continues.toggle()
                                }
                            ORView()
                            CustomExternalAuthButton(imageName: "google", buttonText: "Sign Up with Google", buttonColor: .clear, textColor: .black, frameColor: .gray)
                            CustomExternalAuthButton(imageName: "fbwww", buttonText: "Sign Up with Facebook", buttonColor: Color("fbcolor"), textColor: .white, frameColor: .clear)
                        }
                    }.padding()
                        .frame(width: UIScreen.main.bounds.size.width - 20)
                    Spacer()
                    HStack {
                        Text("Already have an account?")
                        Button {
                            withAnimation {
                                self.signin.toggle()
                            }
                        } label: {
                            Text("Sign In")
                                .foregroundColor(Color("purple-mix"))
                        }
                    }
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .navigationTitle("")
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
