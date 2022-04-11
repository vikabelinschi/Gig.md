//
//  MenuView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 06.04.2022.
//

import SwiftUI

struct MenuView: View{
    var body: some View{
        ZStack {
            Color.white
                .zIndex(0)
            HStack {
                VStack(alignment: .leading, spacing: 30){
                    MenuButtonView(imageName: "person", text: "Profile")
                        .padding(.top, 50)
                    MenuButtonView(imageName: "envelope", text: "Messages")
                    MenuButtonView(imageName: "gear", text: "Settings")
                        Spacer()
                    MenuButtonView(imageName: "rectangle.portrait.and.arrow.right", text: "Sign Out")
                        .padding(.bottom, 20)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack {
                    Button {
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(Color("darkPink"))
                    }
                .padding(.trailing, 5)
                .padding(.top, 40)
                    Spacer()
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View{
        MenuView()
    }
}
