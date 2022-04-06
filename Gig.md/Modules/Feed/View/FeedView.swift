//
//  FeedView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 31.03.2022.
//

import SwiftUI

struct FeedView: View {
    
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
                    Button(action: {
                        
                    }) {
                        Image(systemName: "line.horizontal.3")
                    }
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
