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
    var email: String
    var password: String
    @State var birthDate: Date = Date()
    @ObservedObject var viewModel = UDViewModel()
    
    var body: some View {
        if viewModel.selection {
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
                    CustomTextField(enteredText: $firstName, placeholder: "Enter your first name", color: .white, textColor: .white)
                        .padding(.horizontal, 10)
                }
                
                VStack(alignment: .leading) {
                    Text("Last Name")
                        .font(.system(size: 17))
                        .padding(6)
                        .foregroundColor(.white)
                    CustomTextField(enteredText: $lastName, placeholder: " Enter your last name", color: .white, textColor: .white)
                        .padding(.horizontal, 10)
                }
                VStack(alignment: .leading) {
                    Text("Phone Number")
                        .font(.system(size: 17))
                        .padding(6)
                        .foregroundColor(.white)
                    CustomPhoneField(enteredText: $phoneNumber, placeholder: "12345678", color: .white, textColor: .white)
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
                CustomButton(buttonText: "SIGN UP", buttonColor: .white, textColor: Color("darkPink"), action: {
                    withAnimation {
                        viewModel.signUpPressed(email: email, password: password, name: firstName, surname: lastName, phone: "+373\(phoneNumber)", age: birthDate) 
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
        UserDetailsView(firstName: "a", lastName: "a", phoneNumber: "a", email: "a", password: "a", birthDate: Date())
    }
}
