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
    @State var checked: Bool = false
    var body: some View {
        NavigationView{
            VStack(spacing: 40) {
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width: 180, height: 60)
                VStack(alignment: .leading) {
                    HStack(spacing: 4) {
                        TextField("Enter a valid email", text: $username)
                            .foregroundColor(.black)
                    }
                    Color.blue.frame(height:CGFloat(3) / UIScreen.main.scale)
                        .padding(.bottom)
                    HStack(spacing: 4) {
                        SecureField("Enter a password", text: $password)
                            .foregroundColor(.black)
                    }
                    Color.blue.frame(height:CGFloat(3) / UIScreen.main.scale)
                        .padding(.bottom)
                    Toggle("I agree to the Gig.md User Agreement and Privacy Policy", isOn: $checked)
                        .toggleStyle(CheckboxToggleStyle(style: .square))
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                    VStack(spacing: 20) {
                        Button(action: {}) {
                            Text("Sign Up")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .cornerRadius(5)
                        }
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44)
                        .foregroundColor(.black)
                        .background(Color.blue)
                        .cornerRadius(5)
                        HStack {
                            Color.gray.frame(height:CGFloat(3) / UIScreen.main.scale)
                            Text(" OR ")
                                .fontWeight(.semibold)
                            Color.gray.frame(height:CGFloat(3) / UIScreen.main.scale)
                            
                        }
                        Button(action: {}) {
                            Image("google")
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .leading)
                                .padding()
                            Text("Sign Up with Google")
                                .fontWeight(.semibold)
                                .frame(width: 200, height: 40, alignment: .leading)
                        }
                        .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 44, alignment: .leading)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                        .cornerRadius(5)
                        Button(action: {}) {
                            Image("fbwww")
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .leading)
                                .padding()
                            Text("Sign Up with Facebook")
                                .fontWeight(.semibold)
                                .frame(width: 200, height: 40, alignment: .leading)
                        }
                        .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 44, alignment: .leading)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                        .background(Color("fbcolor"))
                        .cornerRadius(5)
                    }
                }.padding()
                    .frame(width: UIScreen.main.bounds.size.width - 20)
                Spacer()
                HStack {
                    Text("Already have an account?")
                    NavigationLink(destination: LoginView()) {
                        Text("Sign In")
                    }
                }
            }
        }  .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
