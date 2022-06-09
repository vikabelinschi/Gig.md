//
//  NotificationBox.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 16.05.2022.
//

import SwiftUI

struct NotificationBox: View {
    @State var employer: EmployerAcceptDetailsModel
    @ObservedObject var viewModel = NotificationsViewModel()
    var body: some View {
        if !viewModel.hideEmployerDetails {
            VStack {
                Text(employer.userName)
                    .padding(8)
                    .padding(.top, 30)
                    .foregroundColor(.white)
                VStack(alignment: .leading, spacing: 20) {
                    Text("Description")
                        .bold()
                    Text(employer.description)
                    Text("Skills")
                        .bold()
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(employer.skills, id: \.self) { skill in
                            Text(skill)
                        }
                    }
                    if let education = employer.educationDetails {
                        Text("Education")
                            .bold()
                        VStack {
                            ForEach(education, id: \.self) {
                                education in
                                Text(education)
                            }
                        }
                    }
                }
                .foregroundColor(.white)
                HStack(spacing: 15){
                    CustomButton(buttonText: "Reject", buttonColor: .white, textColor: .red) {
                        viewModel.showEmployerDetails = false
                        viewModel.hideEmployerDetails = true
                        viewModel.rejectEmployee(jobId: employer.jobId)
                    }
                    CustomButton(buttonText: "Accept", buttonColor: .white, textColor: .green) {
                        viewModel.acceptEmployee(jobId: employer.jobId)
                        viewModel.hideEmployerDetails = true
                        let tel = "tel://"
                        let formattedString = tel + (employer.phoneNumber)
                        guard let url = URL(string: formattedString) else { return }
                        UIApplication.shared.open(url)
                    }
                }
            }
            .padding(20)
            .background(Color("purple-mix").opacity(0.7))
            .cornerRadius(20)
        }
    }
}

struct NotificationBox_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBox(employer: employerModel)
    }
}


