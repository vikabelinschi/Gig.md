//
//  JobListView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 05.04.2022.
//

import SwiftUI

struct JobListView: View {
    var jobs: [JobListModel]
    @State var tappedJob: Bool = false
    @State var selectedJob: JobListModel?
    var screen = UIScreen.main.bounds
    var body: some View {
        if !tappedJob {
            ScrollView {
                VStack {
                    ForEach(jobs,  id: \.self) { job in
                    JobRowView(job: job)
                        .padding(10)
                        .onTapGesture {
                            withAnimation {
                                self.selectedJob = job
                                self.tappedJob.toggle()
                            }
                        }
                }
            }
        }
    }
        else {
            if let selectedJob = selectedJob {
                JobDetailPage(jobId: selectedJob.id)
                    .frame(width: screen.width - 50)
                    .onTapGesture {
                        self.tappedJob.toggle()
                    }
            }
        }
}
}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        JobListView(jobs: jobs1)
    }
}
