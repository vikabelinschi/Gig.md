//
//  NotificationsView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 16.05.2022.
//

import SwiftUI

struct NotificationsView: View {
    var notifications: [NotificationModel] = [notifInfo1, notifInfo2]
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color("purple-mix"))]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().tintColor = UIColor(Color("purple-mix"))
        
    }

    var body: some View {
            ScrollView {
                    VStack {
                            ForEach(notifications, id:\.self) {
                                notification in
                                NotificationBox(newNotif: notification)
                            }
                            .padding(20)
                            Spacer()
                }
            }
            .navigationTitle("Notifications")
            .background(            LinearGradient(gradient: Gradient(colors: [Color("darkBlue").opacity(0.55),Color("purple-mix").opacity(0.7), Color("p").opacity(0.5)]), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.purple)
    }
}


struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
