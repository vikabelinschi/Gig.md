//
//  JobDetailPage.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 04.05.2022.
//

import SwiftUI

struct JobDetailPage: View {
    var job: JobModel
    var body: some View {
        ZStack {
            ZStack {
                Color("darkPink").opacity(0.3)
        
                VStack {
                    Text(job.name)
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
                        Text(job.period)
                        Text("Location")
                            .bold()
                        Text(job.location)
                        if let requirements = job.requirements {
                            Text("Requirements")
                                .bold()
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(requirements, id: \.self) {
                                    requirement in
                                    Text(requirement)
                                }
                            }
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
}
}

struct JobDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        JobDetailPage(job: job1)
    }
}
