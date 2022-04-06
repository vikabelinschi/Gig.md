//
//  OnboardingView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 02.03.2022.
//

import SwiftUI

struct OnboardingView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var phoneNumber: String = ""
    var body: some View {
        NavigationView{
            VStack(spacing: 40) {
                VStack(alignment: .leading, spacing: 1) {
                    Text("Personal Info")
                        .font(.system(size: 30, weight: .bold, design: .default))
                    VStack(alignment: .leading, spacing: 15) {
                    Text("Enter your information. You can change this later.")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                        CustomTextField(enteredText: firstName, placeholder: "First name")
                    CustomTextField(enteredText: lastName, placeholder: "Last name")
                    VStack(spacing: 4) {
                        HStack{
                            Text("+373")
                                .foregroundColor(changeTextColor(text: phoneNumber))
                            TextField("_ _ _ _ _ _ _ _", text: $phoneNumber)
                        }
                            .foregroundColor(.black)
                    Color.blue.frame(height:CGFloat(3) / UIScreen.main.scale)
                        .padding(.bottom)
                    }
                        CustomButton(buttonText: "NEXT", buttonColor: .blue, textColor: .white)
                    }
                }.padding()
                    .frame(width: UIScreen.main.bounds.size.width - 30)
                Spacer()
                 
            }
        }  .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

func changeTextColor(text: String) -> Color
{
    if(text != "")
    {
        return Color.black;
    }
    else
    {
        return Color.gray;
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
