//
//  CustomTabBar.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 06.04.2022.
//

import SwiftUI

struct TabBarIcon: View {
     
    @StateObject var tabBarRouter: TabBarRouter
      let assignedPage: Page
    
     let width, height: CGFloat
     let systemIconName, tabName: String
     
     
    var body: some View {
        Button(action: {
            tabBarRouter.currentPage = assignedPage
        }) {
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
            .foregroundColor(tabBarRouter.currentPage == assignedPage ? Color("darkPink") : .white)
        }
    }
}

