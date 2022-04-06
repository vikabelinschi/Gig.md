//
//  CustomTabBar.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 06.04.2022.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        GeometryReader { geometry in
            HStack {
                TabBarIcon(width: geometry.size.width/3, height: geometry.size.height/30, systemIconName: "briefcase.fill", tabName: "Jobs")
                ZStack {
                     Circle()
                         .foregroundColor(.white)
                         .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                         .shadow(radius: 4)
                    Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                            .foregroundColor(Color("workers"))
                 } .offset(y: -geometry.size.height/8/2)
                
                TabBarIcon(width: geometry.size.width/3, height: geometry.size.height/30, systemIconName: "person.2.fill", tabName: "Workers")
             }
            .frame(width: geometry.size.width, height: geometry.size.height/8)
            .background(Color("tabBar").shadow(radius: 2))
        }
    }
}

struct TabBarIcon: View {
     
     let width, height: CGFloat
     let systemIconName, tabName: String
     
     
     var body: some View {
         VStack {
             Image(systemName: systemIconName)
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: width, height: height)
                 .padding(.top, 10)
             Text(tabName)
                 .font(.footnote)
             Spacer()
         }
     }
 }

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
