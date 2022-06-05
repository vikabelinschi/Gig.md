//
//  FeedView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 31.03.2022.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject var tabBarRouter: TabBarRouter
    @ObservedObject var feedViewModel =  FeedViewModel()
    @State var showPopUp = false
    @State private var showingSheet = false
    @State private var showingSortSheet = false
    @State private var radius: CGFloat = 0.0
    @State var radius2: CGFloat = 0.0
    @State var showTabBar: Bool =  true
    
    var screen = UIScreen.main.bounds
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    if showingSheet {
                        MenuView(showSheet: $showingSheet, showTabBar: $showTabBar, radius: $radius2)
                            .edgesIgnoringSafeArea(.all)
                            .transition(.move(edge: .leading))
                            .zIndex(5)
                            .navigationBarHidden(true)
                    }
                    if showingSortSheet {
                        FilterView(showTabBar: $showTabBar, showingSheet: $showingSortSheet, radius: $radius2)
                            .transition(.move(edge: .bottom))
                            .frame(width: screen.width, height: screen.height/1.5, alignment: .bottom)
                            .zIndex(4)
                            .edgesIgnoringSafeArea(.all)
                            .offset(x: screen.minX, y: screen.minY + screen.height/6)
                            .navigationBarHidden(true)
                    }
                    VStack {
                        Spacer()
                        switch tabBarRouter.currentPage {
                        case .jobs:
                            JobListView(jobs: feedViewModel.availableJobs)
                                .blur(radius: radius2)
                                .onAppear {
                                    feedViewModel.loadAvailableJobs()
                                }
                        case .workers:
                            WorkersListView(workers: feedViewModel.availableWorkers)
                                .blur(radius: radius2)
                                .onAppear {
                                    feedViewModel.loadAvailableWorkers()
                                }
                        }
                        Spacer()
                        Color.white.frame(height:CGFloat(3) / UIScreen.main.scale)
                        ZStack {
                            if showTabBar {
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
                                self.showTabBar = false
                                showingSheet = true
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
                                showTabBar = false
                                showingSortSheet.toggle()
                                self.radius2 = showingSortSheet ? 20 : 0
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
                LinearGradient(gradient: Gradient(colors: [Color("darkBlue").opacity(0.55),Color("purple-mix").opacity(0.7), Color("p").opacity(0.5)]), startPoint: .top, endPoint: .bottom))
        }
//        .sheet(isPresented: $showingSortSheet) {
//                    FilterView()
//                }
        .accentColor(Color("darkPink"))
    }
    
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FeedView(tabBarRouter: TabBarRouter())
        }
    }
}
