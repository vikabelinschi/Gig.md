//
//  PostedJobsView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 18.05.2022.
//

import SwiftUI

struct PostedJobsView: View {
    var postedJobs: [JobModel] = [job1, job2, job3]
    var body: some View {
        ScrollView {
            VStack {
                ForEach(postedJobs, id:\.self) {
                    job in
                    PostedJobsBox(job: job)
                }
                .padding(20)
                Spacer()
            }
        }
        .navigationTitle("Posted Jobs")
        .background(            LinearGradient(gradient: Gradient(colors: [Color("darkBlue").opacity(0.55),Color("purple-mix").opacity(0.7), Color("p").opacity(0.5)]), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.purple)
    }
}


struct PostedJobsView_Previews: PreviewProvider {
    static var previews: some View {
        PostedJobsView()
    }
}
