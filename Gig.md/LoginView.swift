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
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width: 180, height: 60)
                VStack(alignment: .leading) {
                    HStack(spacing: 4) {
                        TextField("Enter your email", text: $username)
                            .foregroundColor(.black)
                    }
                    Color.blue.frame(height:CGFloat(3) / UIScreen.main.scale)
                        .padding(.bottom)
                    HStack(spacing: 4) {
                        SecureField("Enter your password", text: $password)
                            .foregroundColor(.black)
                    }
                    Color.blue.frame(height:CGFloat(3) / UIScreen.main.scale)
                        .padding(.bottom)
                    VStack(spacing: 20) {
                        Button(action: {}) {
                            Text("Sign In")
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
                            Text("Sign In with Google")
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
                            Text("Sign In with Facebook")
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
                    Text("Don't have an account?")
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                    }
                }
            }
        }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
