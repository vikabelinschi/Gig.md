//
//  NotificationsView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 16.05.2022.
//

import SwiftUI

struct NotificationsView: View {
    @ObservedObject var viewModel = NotificationsViewModel()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color("purple-mix"))]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().tintColor = UIColor(Color("purple-mix"))
        
    }

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("darkBlue").opacity(0.55),Color("purple-mix").opacity(0.7), Color("p").opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                        VStack {
                            if viewModel.listOfJobs != [] {
                            ForEach(viewModel.listOfJobs, id:\.self) {
                                    job in
                                    BookedBox(job: job)
                                }
                                .padding(20)
                                Spacer()
                            } else {
                                VStack {
                                    Spacer()
                                    Text("You don't have notifications.")
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                            }
                    }
                }
                .navigationTitle("Notifications")
            .foregroundColor(.purple)
            .onAppear{
             viewModel.getBookedJobsListDetails()
        }
        }
    }
    
}


struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
