//
//  BookedBox.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 06.06.2022.
//

import SwiftUI

struct BookedBox: View {
    @State var job: JobOfferDetailsModel
    @ObservedObject var viewModel = NotificationsViewModel()
    var body: some View {
        if viewModel.showEmployerDetails {
            NotificationBox(employer: viewModel.employer!)
        } else {
            VStack(alignment: .leading, spacing: 10) {
                Text("Someone booked your '\(job.jobName)' gig")
                    .foregroundColor(.white)
                HStack(spacing: 15){
                    CustomButton(buttonText: "Check the worker", buttonColor: .white, textColor: .purple) {
                        viewModel.getEmployerInfoFromJobId(jobId: job.id)
                    }
                }
            }
            .padding(20)
            .background(Color("purple-mix").opacity(0.7))
            .cornerRadius(20)
        }
    }
}

struct BookedBox_Previews: PreviewProvider {
    static var previews: some View {
        BookedBox(job: jobf)
    }
}


