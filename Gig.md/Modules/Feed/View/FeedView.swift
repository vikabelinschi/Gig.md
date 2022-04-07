//
//  FeedView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 31.03.2022.
//

import SwiftUI

struct FeedView: View {
    
   // var tabBarRouter: TabBarRouter
    @State var showPopUp = false
    @State private var showingSheet = false
    @State private var showingSortSheet = false
    @State private var radius: CGFloat = 0.0
    @State private var radius2: CGFloat = 0.0
    var screen = UIScreen.main.bounds
    var body: some View {
        
        NavigationView {
            GeometryReader { geometry in
                VStack {
                       Spacer()
                    WorkersListView(workers: workers)
                        .blur(radius: radius2)
                       Spacer()
                    ZStack {
                        if showPopUp {
                                                PlusMenuView(widthAndHeight: geometry.size.width/7)
                                                    .offset(y: -geometry.size.height/6)
                                            }
                        HStack {
                            TabBarIcon(width: geometry.size.width/3, height: geometry.size.height/30, systemIconName: "briefcase.fill", tabName: "Jobs")
                            CircleButton(showPopUp: showPopUp, action: {
                                withAnimation {
                                    showPopUp.toggle()
                                    self.radius2 = showPopUp ? 10 : 0
                                    
                                }
                            }, geometry: geometry)
                                .offset(y: -geometry.size.height/8/2)
                            
                            TabBarIcon(width: geometry.size.width/3, height: geometry.size.height/30, systemIconName: "person.2.fill", tabName: "Workers")
                         }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color("tabBar").shadow(radius: 2))
                    }
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    VStack {
                        Button() {
                            withAnimation {
                                showingSortSheet.toggle()
                            }
                        } label: {
                            Image(systemName: "arrow.up.arrow.down")
                                .resizable()
                                .frame(width: 19, height: 15)
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
