//
//  PostedJobsBox.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 18.05.2022.
//

import SwiftUI

struct PostedJobsBox: View {
    var job: JobModel
    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 10) {
                Text(job.name)
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .semibold, design: .default))
                Text(job.description)
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .regular, design: .default))
            }
            Text(job.price)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold, design: .default))
        }
        .padding(20)
        .background(Color("purple-mix").opacity(0.7))
        .cornerRadius(20)
    }
}

struct PostedJobsBox_Previews: PreviewProvider {
    static var previews: some View {
        PostedJobsBox(job: job1)
    }
}
