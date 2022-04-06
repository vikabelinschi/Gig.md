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
            TabView {
                JobListView(jobs: jobs)
                    .tabItem {
                        Label("Jobs", systemImage: "briefcase.fill")
                    }
                
                WorkersListView(workers: workers)
                    .tabItem {
                        Label("Workers", systemImage: "person.3")
                    }
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    VStack {
                        Button() {
                            withAnimation {
                                showingSheet.toggle()
                                self.radius = 20
                                print(showingSheet)
                                
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
