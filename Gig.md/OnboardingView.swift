//
//  OnboardingView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 02.03.2022.
//

import SwiftUI

struct OnboardingView: View {
    @State var username: String = ""
    var body: some View {
        NavigationView{
            VStack(spacing: 40) {
                Image("logo")
                    .resizable()
                    .frame(width: 180, height: 60)
                VStack(alignment: .leading, spacing: 15) {
                        Text("Choose your username")
                            .bold()
                    VStack(alignment: .leading, spacing: 30) {
                        Text("Please note that the username can't be changed later")
                        .font(.system(size: 14))
                    TextField("Username", text: $username)
                        .foregroundColor(.black)
                        .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(.black, lineWidth: 0.5)
                            )
                            .padding(0)
                    Button(action: {}) {
                        Text("NEXT")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .cornerRadius(5)
                    }
                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44)
                    .foregroundColor(.black)
                    .background(Color.blue)
                    .cornerRadius(5)
                    }
                }.padding()
                    .frame(width: UIScreen.main.bounds.size.width - 30)
                Spacer()
                 
            }
        }  .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
