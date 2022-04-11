//
//  FeedView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 31.03.2022.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject var tabBarRouter: TabBarRouter
    @State var showPopUp = false
    @State private var showingSheet = false
    @State private var showingSortSheet = false
    @State private var radius: CGFloat = 0.0
    @State private var radius2: CGFloat = 0.0
    var screen = UIScreen.main.bounds
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    if showingSheet {
                        MenuView()
                            .transition(.move(edge: .leading))
                            .frame(width: screen.width/1.2, height: screen.height, alignment: .leading)
                            .zIndex(4)
                            .edgesIgnoringSafeArea(.all)
                            .offset(x: -32)
                    }
                    VStack {
                        Spacer()
                        switch tabBarRouter.currentPage {
                        case .jobs:
                            JobListView(jobs: jobs)
                                .blur(radius: radius2)
                        case .workers:
                            WorkersListView(workers: workers)
                                .blur(radius: radius2)
                        }
                        Spacer()
                        Color.white.frame(height:CGFloat(3) / UIScreen.main.scale)
                        ZStack {
                            if showPopUp {
                                PlusMenuView(widthAndHeight: geometry.size.width/7)
                                    .offset(y: -geometry.size.height/6)
                            }
                            HStack {
                                TabBarIcon(tabBarRouter: tabBarRouter, assignedPage: .jobs, width: geometry.size.width/3, height: geometry.size.height/30, systemIconName: "briefcase.fill", tabName: "Jobs")
                                CircleButton(showPopUp: showPopUp, action: {
                                    withAnimation {
                                        showPopUp.toggle()
                                        self.radius2 = showPopUp ? 10 : 0
                                    }
                                }, geometry: geometry)
                                    .offset(y: -geometry.size.height/8/1.7)
                                
                                TabBarIcon(tabBarRouter: tabBarRouter, assignedPage: .workers, width: geometry.size.width/3, height: geometry.size.height/30, systemIconName: "person.2.fill", tabName: "Workers")
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height/8)
                            .background(.clear)
                        }
                    }
                    .edgesIgnoringSafeArea(.bottom)
                .padding(.horizontal, -4)
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    VStack {
                        Button() {
                            withAnimation {
                                showingSheet.toggle()
                                self.radius2 = showingSheet ? 20 : 0
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.white)
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
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("darkBlue").opacity(0.8),Color("purple-mix").opacity(0.9), Color("pinkk")]), startPoint: .top, endPoint: .bottom))
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FeedView(tabBarRouter: TabBarRouter())
        }
    }
}
