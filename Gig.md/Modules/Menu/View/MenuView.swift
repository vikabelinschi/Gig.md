//
//  MenuView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 06.04.2022.
//

import SwiftUI

struct MenuView: View {
    @Binding var showSheet: Bool
    @Binding var showTabBar: Bool
    @Binding var radius: CGFloat
    @State var showLogin: Bool = false
    var body: some View {
if showLogin {
           LoginView()
        .transition(.move(edge: .trailing))
       }
        else if showSheet {
            ZStack {
                Color.white.opacity(0.5)
                    .zIndex(0)
                HStack {
                    VStack(alignment: .leading, spacing: 30){
                        NavigationLink(destination: NotificationsView()) {
                        MenuButtonView(imageName: "envelope", text: "Notifications")
                        }
                        NavigationLink(destination: WorkerProfileView()) {
                        MenuButtonView(imageName: "person.text.rectangle", text: "Worker Profile")
                        }
                        NavigationLink(destination: PostedJobsView()) {
                        MenuButtonView(imageName: "briefcase", text: "Posted Jobs")
                        }
                        MenuButtonView(imageName: "heart", text: "Favourites")
                        Spacer()
                        Button(action: {
                            showLogin = true
                            showSheet = false
                        })  {
                        MenuButtonView(imageName: "rectangle.portrait.and.arrow.right", text: "Sign Out")
                            .padding(.bottom, 40)
                        }
                        
                    }
                    .padding(.top, 100)
                    .padding()
                    .padding(.leading, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    VStack {
                        Button {
                            withAnimation {
                                showTabBar = true
                                showSheet = false
                                radius = 0.00
                            }
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color("purple-mix"))
                            
                        }
                        .padding(.trailing, 20)
                        .padding(.top, 70)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View{
        MenuView(showSheet: .constant(false), showTabBar: .constant(true), radius: .constant(0.00))
    }
}
