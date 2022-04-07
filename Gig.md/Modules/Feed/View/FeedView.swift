//
//  FeedView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 31.03.2022.
//

import SwiftUI

struct FeedView: View {
    
    @State private var showingSheet = false
    @State private var radius: CGFloat = 0.0
    var screen = UIScreen.main.bounds
    var body: some View {
        
        NavigationView {
            GeometryReader { geometry in
                VStack {
                       Spacer()
                    WorkersListView(workers: workers)
                       Spacer()
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
                                    .frame(width: abs((geometry.size.width/7)-6) , height: abs((geometry.size.width/7)-6))
                                    .foregroundColor(Color("workers"))
                         } .offset(y: -geometry.size.height/8/2)
                        
                        TabBarIcon(width: geometry.size.width/3, height: geometry.size.height/30, systemIconName: "person.2.fill", tabName: "Workers")
                     }
                    .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color("tabBar").shadow(radius: 2))
                }
                .edgesIgnoringSafeArea(.bottom)
                .padding(.horizontal, -4)
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    VStack {
                        Button() {
                            withAnimation {
                                showingSheet.toggle()
                                self.radius = 20
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal")
                        }
                        if showingSheet {
                            MenuView()
                                .transition(.move(edge: .leading))
                                .frame(width: screen.width/2, height: screen.height, alignment: .top)
                                .position(x: 90, y: 320)
                            
                        }
                    }
                }
            }
            .blur(radius: radius)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FeedView()
        }
    }
}
