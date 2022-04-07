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
                VStack(alignment: .leading){
                    HStack {
                        Button {
                        } label: {
                            Image(systemName: "x.circle.fill")
                               // .resizable()
                                .foregroundColor(.gray)
                        }
                       // .padding(.leading, 160)
                        .padding(.top, 20)
                    }
                    HStack{
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                            .imageScale(.large)
                        Text("Profile")
                            .foregroundColor(.gray)
                            .font(.headline)
                    }
                    .padding(.top, 30)
                    HStack{
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                            .imageScale(.large)
                        Text("Messages")
                            .foregroundColor(.gray)
                            .font(.headline)
                    }
                    .padding(.top, 30)
                    HStack{
                        Image(systemName: "gear")
                            .foregroundColor(.gray)
                            .imageScale(.large)
                        Text("Settings")
                            .foregroundColor(.gray)
                            .font(.headline)
                    }
                    .padding(.top, 30)
                    Spacer()
                    HStack{
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .foregroundColor(.gray)
                            .imageScale(.large)
                        Text("Sign Out")
                            .foregroundColor(.gray)
                            .font(.headline)
                    }
                    .padding(.bottom, 30)
                    
                }
             //   .padding()
                //.frame(maxWidth: .infinity, alignment: .leading)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View{
        MenuView()
    }
}
