//
//  UserDetailsView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 10.05.2022.
//

import SwiftUI

struct UserDetailsView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var phoneNumber: String = ""
    @State var selection: Bool = false
    @State var birthDate: Date = Date.now
    var body: some View {
        if selection {
            FeedView(tabBarRouter: TabBarRouter())
        } else {
        NavigationView {
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Let's get you started")
                    .padding(10)
                    .font(.system(size: 40, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .shadow(radius: 20)
                VStack(alignment: .leading) { Text("First Name")
                        .font(.system(size: 17))
                        .padding(6)
                        .padding(.top, 40)
                        .foregroundColor(.white)
                    CustomTextField(enteredText: firstName, placeholder: "Enter your first name", color: .white, textColor: .white)
                        .padding(.horizontal, 10)
                }
                
                VStack(alignment: .leading) {
                    Text("Last Name")
                        .font(.system(size: 17))
                        .padding(6)
                        .foregroundColor(.white)
                    CustomTextField(enteredText: lastName, placeholder: " Enter your last name", color: .white, textColor: .white)
                        .padding(.horizontal, 10)
                }
                VStack(alignment: .leading) {
                    Text("Phone Number")
                        .font(.system(size: 17))
                        .padding(6)
                        .foregroundColor(.white)
                    CustomPhoneField(enteredText: phoneNumber, placeholder: "12345678", color: .white, textColor: .white)
                        .padding(.horizontal, 10)
                }
                VStack {
                    DatePicker( selection: $birthDate, displayedComponents: .date) {
                        Text("Birth date")
                            .font(.system(size: 17))
                    }
                    .datePickerStyle(.compact)
                    .accentColor(Color("darkPink"))
                    .colorInvert()
                    .colorMultiply(Color.white)
                    
                }
                .padding(6)
                Spacer()
                //                    NavigationLink(destination: FeedView(tabBarRouter: TabBarRouter())) {
                //                        Group {
                //                        Text("SIGN UP")
                //                            .fontWeight(.semibold)
                //                            .foregroundColor(Color("darkPink"))
                //                            .cornerRadius(5)
                //                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44)
                //                    .background(.white)
                //                    .cornerRadius(5)
                CustomButton(buttonText: "SIGN UP", buttonColor: .white, textColor: Color("darkPink"), action: {
                    withAnimation {
                        self.selection.toggle()
                    }
                })
                    .shadow(radius: 30)
            }
            
            .padding(20)
            
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("darkBlue").opacity(0.55),Color("purple-mix").opacity(0.7), Color("p").opacity(0.5)]), startPoint: .top, endPoint: .bottom))
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
        }
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView()
    }
}
