//
//  JobDetailPage.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 04.05.2022.
//

import SwiftUI

struct JobDetailPage: View {
    var jobId: Int
    @ObservedObject var viewModel = JobDetailViewModel()
    var body: some View {
        ZStack {
            ZStack {
                Color("darkPink").opacity(0.3)
                
                VStack {
                    if let job = viewModel.detailedJob {
                        Text(job.jobName)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .padding(8)
                            .padding(.top, 10)
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Description")
                                .bold()
                            Text(job.description)
                            Text("Category")
                                .bold()
                            Text(job.category)
                            Text("Period")
                                .bold()
                            Text(job.date)
                            Text("Location")
                                .bold()
                            Text(job.location)
                        }
                    }
                    Button {
                        
                    } label: {
                        Text("Apply to this gig")
                            .foregroundColor(Color("darkPink"))
                            .padding(.horizontal, 30)
                            .padding(.vertical,10)
                            .background(.white)
                            .cornerRadius(20)
                            .padding()
                    }
                    
                }
                .foregroundColor(.white)
                .padding()
            }
            .cornerRadius(20)
            .fixedSize(horizontal: false, vertical: true)
        }
        .onAppear {
            viewModel.getJobDetail(jobId: jobId)
        }
    }
}

struct JobDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        JobDetailPage(jobId: 1)
    }
}
