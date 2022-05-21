//
//  NotificationBox.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 16.05.2022.
//

import SwiftUI

struct NotificationBox: View {
    @State var newNotif: NotificationModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(newNotif.name)
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .bold, design: .default))
            Text("Description")
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .semibold, design: .default))
            Text(newNotif.description)
                .foregroundColor(.white)
            HStack(spacing: 15){
                CustomButton(buttonText: "Reject", buttonColor: .white, textColor: .red)
                CustomButton(buttonText: "Accept", buttonColor: .white, textColor: .green)
            }
        }
        .padding(20)
        .background(Color("purple-mix").opacity(0.7))
        .cornerRadius(20)
    }
}

struct NotificationBox_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBox(newNotif: notifInfo1)
    }
}


