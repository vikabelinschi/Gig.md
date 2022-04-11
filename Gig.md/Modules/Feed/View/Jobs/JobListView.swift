`//
//  JobListView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 05.04.2022.
//

import SwiftUI

struct JobListView: View {
    var jobs: [JobModel]
    var body: some View {
        ScrollView {
            VStack {
                ForEach(jobs,  id: \.self) { job in
                    JobRowView(job: job)
                        .padding(10)                    
                }
            }
        }
    }
}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        JobListView(jobs: jobs)
    }
}
`
