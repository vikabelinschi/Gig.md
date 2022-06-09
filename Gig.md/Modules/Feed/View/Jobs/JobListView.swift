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
    @ObservedObject var feedViewModel =  FeedViewModel()
    @State private var now = Date()
    var screen = UIScreen.main.bounds
    
    func check() -> [JobListModel] {
        if feedViewModel.availableJobs != [] {
            return feedViewModel.availableJobs
        } else {
            return jobs
        }
    }
    
    var body: some View {
        if !tappedJob {
            RefreshableScrollView(onRefresh: { done in
                   DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                     self.now = Date()
                       feedViewModel.loadAvailableJobs()
                     done()
                   }
                 }) {
                VStack {
                    ForEach(check(),  id: \.self) { job in
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
                JobDetailPage(jobId: selectedJob.id, isPresented: $tappedJob)
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
