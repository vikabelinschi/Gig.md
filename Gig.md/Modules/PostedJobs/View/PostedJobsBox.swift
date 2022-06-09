//
//  PostedJobsBox.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 18.05.2022.
//

import SwiftUI

struct PostedJobsBox: View {
    var job: UsersJobsModel
    var screen =  UIScreen.main.bounds
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(job.jobName)
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .semibold, design: .default))
            }
            Spacer()
            Text(String(job.wage) + "$")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold, design: .default))
        }
        .frame(width: screen.width - 60)
        .padding(20)
        .background(Color("purple-mix").opacity(0.7))
        .cornerRadius(20)
    }
}

struct PostedJobsBox_Previews: PreviewProvider {
    static var previews: some View {
        PostedJobsBox(job: UsersJobsModel(id: 1, jobName: "sdasd", wage: 22, userName: "Afas"))
    }
}
