//
//  Welcome.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 16.05.2022.
//

import SwiftUI

struct Welcome: View {
    @State var showSignIn: Bool = false
    @State var showSignUp: Bool = false
    var body: some View {
        if showSignIn {
            LoginView()
        } else if showSignUp {
            SignUpView()
        } else {
            ZStack {
                Image("welcome")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack() {
                    VStack(alignment: .leading) {
                        Text("Get your")
                            .foregroundColor(.white)
                            .font(.system(size: 44, weight: .bold, design: Font.Design.default))
                        Text("gig")
                            .foregroundColor(.white)
                            .font(.system(size: 45, weight: .bold, design: Font.Design.default))
                            .overlay {
                                LinearGradient(colors: [Color("p").opacity(0.6), Color("purple-mix").opacity(0.6), Color("bluee").opacity(0.7)], startPoint: .leading, endPoint: .trailing)
                                    .mask {
                                        Text("gig")
                                            .font(.system(size: 45, weight: .bold, design: Font.Design.default))
                                    }
                            }
                            .shadow(radius: 20)
                    }
                    .shadow(radius: 20)
                    .padding(.top, 80)
                    .padding(.trailing, 150)
                    Spacer()
                    CustomButton(buttonText: "Sign Up", buttonColor: Color("purple-mix"), textColor: .white, action: {
                        self.showSignUp.toggle()
                    })
                            .cornerRadius(20)
                            .padding(.horizontal, 50)
                            .shadow(radius: 20)
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                        Button {
                            showSignIn.toggle()
                        } label: {
                            Text("Sign In")
                                .font(.system(size: 15, weight: .semibold, design: .default))
                                .foregroundColor(.white)
                                .overlay {
                                    LinearGradient(colors: [Color("p").opacity(0.6), Color("purple-mix").opacity(0.6), Color("bluee").opacity(0.7)], startPoint: .leading, endPoint: .trailing)
                                        .mask {
                                            Text("Sign In")
                                                .font(.system(size: 15, weight: .semibold, design: Font.Design.default))
                                        }
                                }
                                .shadow(radius: 20)
                        }
                    }
                }
                .background(LinearGradient(colors: [Color.black.opacity(0), Color.black.opacity(0.8)],
                                           startPoint: .center,
                                           endPoint: .bottom))
            }
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
